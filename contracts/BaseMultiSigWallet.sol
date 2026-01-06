// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BaseMultiSigWallet {
    address[] public owners;
    uint256 public required;
    mapping(address => bool) public isOwner;
    mapping(uint256 => Transaction) public transactions;

    struct Transaction {
        address to;
        uint256 value;
        bool executed;
        uint256 approvalCount;
    }

    event TransactionProposed(uint256 transactionId, address indexed to, uint256 value);
    event TransactionExecuted(uint256 transactionId);
    event TransactionApproved(uint256 transactionId, address indexed owner);

    modifier onlyOwner() {
        require(isOwner[msg.sender], "Not an owner");
        _;
    }

    modifier notExecuted(uint256 transactionId) {
        require(!transactions[transactionId].executed, "Transaction already executed");
        _;
    }

    constructor(address[] memory _owners, uint256 _required) {
        require(_owners.length >= _required, "Owners count must be greater than or equal to required approvals");
        for (uint256 i = 0; i < _owners.length; i++) {
            require(!isOwner[_owners[i]], "Duplicate owner");
            isOwner[_owners[i]] = true;
        }
        owners = _owners;
        required = _required;
    }

    function proposeTransaction(address to, uint256 value) external onlyOwner {
        uint256 transactionId = uint256(keccak256(abi.encodePacked(to, value, block.timestamp)));
        transactions[transactionId] = Transaction(to, value, false, 0);
        emit TransactionProposed(transactionId, to, value);
    }

    function approveTransaction(uint256 transactionId) external onlyOwner notExecuted(transactionId) {
        Transaction storage txn = transactions[transactionId];
        require(txn.approvalCount < required, "Already enough approvals");

        txn.approvalCount++;
        emit TransactionApproved(transactionId, msg.sender);

        if (txn.approvalCount == required) {
            txn.executed = true;
            payable(txn.to).transfer(txn.value);
            emit TransactionExecuted(transactionId);
        }
    }

    function getOwners() external view returns (address[] memory) {
        return owners;
    }

    receive() external payable {}
}
