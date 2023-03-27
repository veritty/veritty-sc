// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface Raffle {
    event WinnerChosen(address indexed player, uint256 indexed sum, uint256 indexed tokenId);
    event Requested(address indexed player, uint256 requestId);

    function openRaffle() external;
    function stopRaffle() external;
    function pay(address target, uint256 amountInUsdt) external;
    function sendEther(address target, uint256 amount) external;
    function enterRaffle(address refferer) external payable;
}
