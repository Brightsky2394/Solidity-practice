// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NoImmutable {
    // without immutable keyword
    // transaction cost 45989
    address public owner = msg.sender;
    uint public x;

    modifier onlyOwner() {
        require(owner == msg.sender, "Not the owner");
        _;
    }

    function compute() public onlyOwner returns (uint) {
        x += 1;
        return x;
    }
}

contract WithImmutable {
    // without immutable keyword
    // transaction cost 43878
    address public immutable OWNER;
    uint public x;

    constructor() {
        OWNER = msg.sender;
    }

    modifier onlyOwner() {
        require(OWNER == msg.sender, "Not the owner");
        _;
    }

    function compute() public onlyOwner returns (uint) {
        x += 3;
        return x;
    }
}
