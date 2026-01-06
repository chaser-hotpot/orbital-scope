# Orbital Scope — Base Sepolia Testnet Validation

This document outlines the validation process for **Orbital Scope** deployed on **Base Sepolia** during the testnet phase.

---

## Network Details

- **Network**: Base Sepolia  
- **Chain ID**: 84532  
- **RPC URL**: [https://sepolia.base.org](https://sepolia.base.org)  
- **Explorer**: [https://sepolia.basescan.org](https://sepolia.basescan.org)

---

## Validation Steps

### Step 1 — Configuration Check

- [ ] Ensure that **Base Sepolia** is correctly set in the `config/base.networks.json`.
- [ ] Verify that the **RPC URL** for Sepolia (`https://sepolia.base.org`) is set as the default.
- [ ] Confirm that the **chain ID** is `84532` for Sepolia.
- [ ] Check the **explorer URL** is set to **BaseScan Sepolia** (`https://sepolia.basescan.org`).

### Step 2 — RPC Connectivity Test

- [ ] **Fetch the latest block number** via the RPC endpoint to verify connection.
- [ ] **Re-fetch after a short delay** and ensure the block number increments (real-time updates).
- [ ] If RPC fails, switch to a fallback RPC (`https://base-sepolia-rpc.publicnode.com`) and confirm resolution.

### Step 3 — Read-only Probes

Using **sample addresses** from `scripts/sample-addresses.json`, perform the following checks:

- [ ] **ETH balance check** for `exampleEOA` to ensure it returns a valid balance (non-negative).
- [ ] **Contract code check** for `exampleContract`. Ensure it returns valid bytecode or `0x` if not deployed.
- [ ] **Zero address handling**: Ensure no errors occur when querying the zero address (`0x000...000`).
- [ ] **Burn address handling**: Ensure no errors occur when querying the burn address (`0x000...dEaD`).

### Step 4 — Explorer Verification

- [ ] **Open the `exampleEOA` address** in BaseScan Sepolia and verify the correct page loads.
- [ ] **Check the latest block** on **BaseScan Sepolia** and verify it matches the block number returned via RPC.
- [ ] **Ensure that no references to Base Mainnet** are present during Base Sepolia testing.

### Step 5 — Contract Deployment Verification (Optional)

If deploying contracts via the **deploy-contracts.sh** script, verify:
- [ ] **Contract address**: Ensure the contract is deployed to the correct address.
- [ ] **Transaction hash**: Ensure the transaction is recorded on BaseScan Sepolia.
- [ ] **Contract bytecode**: Validate that the contract code is correctly deployed and verified.

---

## Final Review

- [ ] All read-only checks were successful.
- [ ] No Mainnet references appeared during testnet validation.
- [ ] All network and contract configurations passed.
- [ ] Ready for Base Mainnet deployment after final checks.

_Last updated: initial scaffold_
