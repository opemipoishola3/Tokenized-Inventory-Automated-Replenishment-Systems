# Tokenized Inventory Automated Replenishment System

A comprehensive blockchain-based inventory management system built with Clarity smart contracts that automates replenishment processes through tokenized verification and coordination.

## 🏗️ System Architecture

The system consists of five interconnected smart contracts:

### 1. Replenishment Manager (`replenishment-manager.clar`)
- **Purpose**: Validates and manages inventory replenishment managers
- **Key Features**:
    - Manager registration and verification
    - Reputation scoring system
    - Location-based management tracking
    - Authorization controls

### 2. Demand Sensing (`demand-sensing.clar`)
- **Purpose**: Senses and processes inventory demand signals
- **Key Features**:
    - Real-time demand signal processing
    - Historical demand tracking
    - Automatic reorder point calculations
    - Trend analysis and forecasting

### 3. Replenishment Automation (`replenishment-automation.clar`)
- **Purpose**: Automates inventory replenishment processes
- **Key Features**:
    - Automated order creation
    - Rule-based replenishment triggers
    - Order status tracking
    - Integration with demand sensing

### 4. Supplier Coordination (`supplier-coordination.clar`)
- **Purpose**: Coordinates replenishment suppliers and their capabilities
- **Key Features**:
    - Supplier registration and verification
    - Capacity and pricing management
    - Performance tracking
    - Regional delivery coordination

### 5. Optimization Algorithm (`optimization-algorithm.clar`)
- **Purpose**: Optimizes replenishment algorithms and decision making
- **Key Features**:
    - Economic Order Quantity (EOQ) calculations
    - Multi-factor optimization
    - Historical performance analysis
    - Batch optimization processing

## 🚀 Getting Started

### Prerequisites
- Clarinet CLI tool
- Node.js (for testing)
- Stacks blockchain testnet access

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd tokenized-inventory-system
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Initialize Clarinet project:
   \`\`\`bash
   clarinet integrate
   \`\`\`

### Contract Deployment

Deploy contracts in the following order to ensure proper dependencies:

1. \`replenishment-manager.clar\`
2. \`demand-sensing.clar\`
3. \`supplier-coordination.clar\`
4. \`replenishment-automation.clar\`
5. \`optimization-algorithm.clar\`

## 📊 Usage Examples

### Register as a Manager
\`\`\`clarity
(contract-call? .replenishment-manager register-manager
"John Doe"
(list "warehouse-A" "warehouse-B"))
\`\`\`

### Update Demand Signal
\`\`\`clarity
(contract-call? .demand-sensing update-demand-signal
"warehouse-A"
"item-12345"
u100
u20
"increasing"
u3)
\`\`\`

### Create Replenishment Order
\`\`\`clarity
(contract-call? .replenishment-automation create-replenishment-order
"warehouse-A"
"item-12345"
u50
'SP2J6ZY48GV1EZ5V2V5RB9MP66SW86PYKKNRV9EJ7
u2500)
\`\`\`

## 🧪 Testing

Run the test suite:

\`\`\`bash
npm test
\`\`\`

Tests cover:
- Contract function validation
- Business logic verification
- Integration scenarios
- Edge case handling

## 🔧 Configuration

### Optimization Parameters
Configure optimization weights for different factors:
- Cost weight (0-100)
- Speed weight (0-100)
- Reliability weight (0-100)
- Quality weight (0-100)

Total weights must equal 100.

### Automation Rules
Set up automatic replenishment rules:
- Minimum/maximum quantities
- Preferred suppliers
- Auto-order triggers

## 📈 Monitoring and Analytics

The system provides comprehensive monitoring through:
- Real-time demand signals
- Supplier performance metrics
- Order fulfillment tracking
- Optimization efficiency scores

## 🛡️ Security Features

- Principal-based authorization
- Manager verification requirements
- Supplier validation processes
- Transaction audit trails

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Implement changes with tests
4. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Check the documentation
- Contact the development team

## 🔄 Version History

- v1.0.0: Initial system implementation
- Smart contract deployment ready
- Core functionality complete
- Test suite included
  \`\`\`
