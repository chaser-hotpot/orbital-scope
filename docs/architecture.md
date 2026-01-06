# Orbital Scope — Architecture Overview

## Overview

Orbital Scope is designed to interact with **Base networks**, using **Base Sepolia** for testing and **Base Mainnet** for production deployments. The system focuses on **read-only operations** to ensure safety and stability during validation.

---

## Key Design Decisions

### 1. **Base Network Integration**

The tool integrates directly with **Base Sepolia** and **Base Mainnet**:
- **Base Sepolia** is used during the testnet phase for validation and contract testing.
- **Base Mainnet** is used once the contracts pass all testing and are ready for live deployment.

Network configurations (RPC URLs, chain IDs, explorers) are stored centrally in the `config/base.networks.json` file.

### 2. **Read-only Design**

Orbital Scope operates in a **read-only mode**:
- **No transactions are executed**: The tool only queries data from the blockchain.
- **No state modifications**: All operations are limited to querying balances, contract code, and metadata.

This ensures a deterministic and secure validation process, minimizing the risk of introducing bugs or security issues.

---

## Future Considerations

1. **Transaction Simulation**:  
   Although the tool is designed for read-only use, future versions could support transaction simulations on Base networks to validate contract interactions without performing actual writes.

2. **Extended Network Support**:  
   Additional testnets or mainnets in the Base ecosystem can be supported by simply adding their configurations to the `base.networks.json` file.

---

_Last updated: initial scaffold_
