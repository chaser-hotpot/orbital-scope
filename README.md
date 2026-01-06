# Orbital Scope (Built for Base)

Orbital Scope is a lightweight, read-only utility designed to help developers inspect and validate the Base Sepolia network. It offers a fast way to check network configurations, inspect wallet balances, and validate contract deployments without interacting with the blockchain state.

---

## Features

With Orbital Scope, you can:
- Verify your connection to the Base Sepolia network  
- Inspect wallet balances and transaction data  
- View contract bytecode at specific addresses  
- Review recent block data and gas usage  
- Confirm contract deployments on Basescan  

All actions are strictly read-only, meaning no changes are made to the blockchain.

---

## Repository Structure

- **app/orbital-scope.ts**  
  The main script that connects to Coinbase Wallet and interacts with Base Sepolia RPC.

- **contracts/**  
  Solidity contracts deployed to Base Sepolia for testnet validation:
  - `BaseMultiSigWallet.sol`  
  - `BaseStakingContract.sol`  
  - `BaseLottery.sol`  

- **config/**  
  Configuration files that define RPC URLs, explorers, and chainIds for Base networks.
  - `base.networks.json`  

- **scripts/**  
  Utility scripts for testing and contract deployment:
  - `deploy-contracts.sh`  
  - `sample-addresses.json`  

- **logs/**  
  Sample logs and execution outputs for troubleshooting:
  - `execution.log`  

- **docs/**  
  Documentation for understanding the architecture and workflows:
  - `architecture.md`  
  - `testnet-validation.md`  

- **package.json**  
  Lists all the dependencies for the project, including libraries like `viem`, `coinbase-wallet-sdk`, and more.

- **README.md**  
  This file, providing an overview of the project and its usage.

---

## Supported Network

Base Sepolia  
chainId (decimal): 84532  
Explorer: https://sepolia.basescan.org  

---

## How It Works

Orbital Scope connects to Coinbase Wallet using the Coinbase Wallet SDK and uses viem to communicate with Base Sepolia's RPC endpoint. It retrieves blockchain data such as balances, transaction counts, block information, and gas prices. It then provides verified explorer links to allow manual confirmation of the data.

No transactions are signed or broadcast.

---

## Dependencies

The project relies on the following dependencies:
- **Coinbase Wallet SDK** for wallet integration  
- **Viem** for RPC communication  
- **Base and Coinbase Repositories** for network-specific tools and utilities  
- **Axios** for making HTTP requests to external APIs  
- **Web3** for additional wallet functionality  
- **Ethers.js** for enhanced Ethereum protocol support

---

## License

MIT License  
Copyright (c) 2025 YOUR_NAME

---

## Author

GitHub: [chaser-hotpot](https://github.com/chaser-hotpot)  

Email: chaser_hotpot0x@icloud.com

X (twitter): mayonie6004

---

## Testnet Deployment (Base Sepolia)

The following contracts have been deployed to Base Sepolia for validation:

Network: Base Sepolia  
chainId (decimal): 84532  
Explorer: [sepolia.basescan.org](https://sepolia.basescan.org)

Contract BaseMultiSigWallet.sol address:  
0x7A9C5D3E4F6B7C8D9A5E1F2C7A8B6D4C5F2D9A7E

Deployment and verification:
- [Deployment Link](https://sepolia.basescan.org/address/0x7A9C5D3E4F6B7C8D9A5E1F2C7A8B6D4C5F2D9A7E)
- [Code Verification](https://sepolia.basescan.org/0x7A9C5D3E4F6B7C8D9A5E1F2C7A8B6D4C5F2D9A7E/0#code)

Contract BaseStakingContract.sol address:  
0xC4F7A5B9D2E1C7F6E9B3A0C8B7D2C9A5F6C2D3B8

Deployment and verification:
- [Deployment Link](https://sepolia.basescan.org/address/0xC4F7A5B9D2E1C7F6E9B3A0C8B7D2C9A5F6C2D3B8)
- [Code Verification](https://sepolia.basescan.org/0xC4F7A5B9D2E1C7F6E9B3A0C8B7D2C9A5F6C2D3B8/0#code)

Contract BaseLottery.sol address:  
0xF8C2D1A3E7B9A0C6F9A3B7E2C8D1A9E5C0F6B2D3

Deployment and verification:
- [Deployment Link](https://sepolia.basescan.org/address/0xF8C2D1A3E7B9A0C6F9A3B7E2C8D1A9E5C0F6B2D3
- [Code Verification](https://sepolia.basescan.org/0xF8C2D1A3E7B9A0C6F9A3B7E2C8D1A9E5C0F6B2D3/0#code)

These testnet deployments are used to ensure that the Base Sepolia tooling works as expected before moving to mainnet.
