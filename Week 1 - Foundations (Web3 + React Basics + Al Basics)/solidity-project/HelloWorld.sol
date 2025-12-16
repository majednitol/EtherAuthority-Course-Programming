// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract HelloWorld{
    // string public helloWorldMessage = "Hello World";
    function message() public pure returns(string memory){
        return "Hello World";
    }
} 

// contract address : 0x535b4c1c7A56fEA39527E1c8040E7F94FD6fd60D