// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract BaseStakingContract {
    IERC20 public stakingToken;
    uint256 public rewardRate;  // Rewards per block
    uint256 public totalStaked;

    mapping(address => uint256) public stakedAmount;
    mapping(address => uint256) public lastClaimedBlock;
    mapping(address => uint256) public rewards;

    event Staked(address indexed user, uint256 amount);
    event Unstaked(address indexed user, uint256 amount);
    event RewardClaimed(address indexed user, uint256 reward);

    constructor(IERC20 _stakingToken, uint256 _rewardRate) {
        stakingToken = _stakingToken;
        rewardRate = _rewardRate;
    }

    function stake(uint256 amount) external {
        require(amount > 0, "Cannot stake 0");
        stakingToken.transfer(address(this), amount);
        totalStaked += amount;
        stakedAmount[msg.sender] += amount;
        lastClaimedBlock[msg.sender] = block.number;

        emit Staked(msg.sender, amount);
    }

    function unstake(uint256 amount) external {
        require(stakedAmount[msg.sender] >= amount, "Insufficient balance to unstake");
        stakedAmount[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);

        emit Unstaked(msg.sender, amount);
    }

    function claimReward() external {
        uint256 reward = calculateReward(msg.sender);
        rewards[msg.sender] += reward;
        lastClaimedBlock[msg.sender] = block.number;
        stakingToken.transfer(msg.sender, reward);

        emit RewardClaimed(msg.sender, reward);
    }

    function calculateReward(address account) public view returns (uint256) {
        uint256 blocksStaked = block.number - lastClaimedBlock[account];
        return blocksStaked * rewardRate * stakedAmount[account] / totalStaked;
    }

    function getStakedAmount(address account) external view returns (uint256) {
        return stakedAmount[account];
    }

    function getRewards(address account) external view returns (uint256) {
        return rewards[account];
    }
}
