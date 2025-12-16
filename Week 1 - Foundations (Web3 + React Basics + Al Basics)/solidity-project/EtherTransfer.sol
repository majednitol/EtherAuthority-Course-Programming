// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract EtherTransfer {

    error AmountShouldBeGreaterThanZero();

    function deposit() public payable {
        require(msg.value > 0, "Deposit must be greater than 0");
    }

    function sendEther(address payable _to, uint256 _amount) public {
        require(_to != address(0), "Invalid address");
        if (_amount == 0) revert AmountShouldBeGreaterThanZero();
        require(address(this).balance >= _amount, "Not enough balance");
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Transfer failed");
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }}

    // contract address: 0x6dFCc47f688c6FfC4EF9260C51e91bEE635F28D0