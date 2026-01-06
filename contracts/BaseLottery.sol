// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BaseLottery {
    address public owner;
    address[] public players;
    uint256 public ticketPrice;
    bool public lotteryActive;

    event LotteryEntered(address indexed player);
    event LotteryWinner(address indexed winner, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    modifier lotteryIsActive() {
        require(lotteryActive, "Lottery is not active");
        _;
    }

    constructor(uint256 _ticketPrice) {
        owner = msg.sender;
        ticketPrice = _ticketPrice;
        lotteryActive = true;
    }

    function enterLottery() external payable lotteryIsActive {
        require(msg.value == ticketPrice, "Incorrect ticket price");
        players.push(msg.sender);
        emit LotteryEntered(msg.sender);
    }

    function drawWinner() external onlyOwner lotteryIsActive {
        require(players.length > 0, "No players in the lottery");
        uint256 winnerIndex = random() % players.length;
        address winner = players[winnerIndex];
        uint256 prizeAmount = address(this).balance;

        payable(winner).transfer(prizeAmount);
        emit LotteryWinner(winner, prizeAmount);

        // Reset the lottery
        players = new address ;
        lotteryActive = false;
    }

    function random() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }

    function startNewLottery(uint256 _ticketPrice) external onlyOwner {
        ticketPrice = _ticketPrice;
        lotteryActive = true;
    }
}
