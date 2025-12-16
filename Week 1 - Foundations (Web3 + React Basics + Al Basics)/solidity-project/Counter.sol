// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
contract Counter {
    uint public count = 0;
    function increment() public {
        count += 1;
    }
    function decrement() public {
        count -= 1;
    }
    function reset() public {
        count = 0;
    }
    function setCounter(uint _count) public {
        count = _count;
    }
} 
// contract-address : 0x40073D64c676182f318c22De2FD3247Ff3B3F008