;; Demand Sensing Contract
;; Senses and processes inventory demand signals

(define-constant ERR_UNAUTHORIZED (err u401))
(define-constant ERR_INVALID_DATA (err u400))
(define-constant ERR_NOT_FOUND (err u404))

;; Demand signal structure
(define-map demand-signals {location: (string-ascii 20), item-id: (string-ascii 30)} {
  current-stock: uint,
  demand-rate: uint,
  trend: (string-ascii 10),
  last-updated: uint,
  threshold: uint
})

;; Historical demand data
(define-map demand-history {location: (string-ascii 20), item-id: (string-ascii 30), timestamp: uint} {
  stock-level: uint,
  consumption-rate: uint
})

;; Read-only functions
(define-read-only (get-demand-signal (location (string-ascii 20)) (item-id (string-ascii 30)))
  (map-get? demand-signals {location: location, item-id: item-id}))

(define-read-only (calculate-reorder-point (location (string-ascii 20)) (item-id (string-ascii 30)))
  (match (map-get? demand-signals {location: location, item-id: item-id})
    signal-data (let ((demand-rate (get demand-rate signal-data))
                      (threshold (get threshold signal-data)))
                  (some (* demand-rate threshold)))
    none))

(define-read-only (needs-replenishment (location (string-ascii 20)) (item-id (string-ascii 30)))
  (match (map-get? demand-signals {location: location, item-id: item-id})
    signal-data (let ((current-stock (get current-stock signal-data))
                      (reorder-point (unwrap-panic (calculate-reorder-point location item-id))))
                  (<= current-stock reorder-point))
    false))

;; Public functions
(define-public (update-demand-signal
    (location (string-ascii 20))
    (item-id (string-ascii 30))
    (stock uint)
    (demand uint)
    (trend (string-ascii 10))
    (threshold uint))
  (if (> stock u0)
    (begin
      (map-set demand-signals
        {location: location, item-id: item-id}
        {
          current-stock: stock,
          demand-rate: demand,
          trend: trend,
          last-updated: block-height,
          threshold: threshold
        })
      (map-set demand-history
        {location: location, item-id: item-id, timestamp: block-height}
        {stock-level: stock, consumption-rate: demand})
      (ok true))
    ERR_INVALID_DATA))

(define-public (batch-update-signals (signals (list 50 {location: (string-ascii 20), item-id: (string-ascii 30), stock: uint, demand: uint, trend: (string-ascii 10), threshold: uint})))
  (fold check-and-update signals (ok true)))

(define-private (check-and-update (signal {location: (string-ascii 20), item-id: (string-ascii 30), stock: uint, demand: uint, trend: (string-ascii 10), threshold: uint}) (prev-result (response bool uint)))
  (match prev-result
    success (update-demand-signal
              (get location signal)
              (get item-id signal)
              (get stock signal)
              (get demand signal)
              (get trend signal)
              (get threshold signal))
    error (err error)))
