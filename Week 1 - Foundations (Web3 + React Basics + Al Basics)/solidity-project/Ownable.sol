// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Ownable {
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "you are not the owner");
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    function getOwner() public view returns (address) {
        return owner;
    }
}
//contract address : 0x4D2Ff7A95f6d2F7A2630704850aEa3FEB5B8D6Fb
