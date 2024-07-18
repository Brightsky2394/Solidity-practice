// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier ownable() {
        require(owner != address(0), "Invalid address");
        _;
    }

    function setOwner(address _newOwner) external ownable {
        owner = _newOwner;
    }

    function onlyOwnerCanCallThisFunc() external ownable {
        // code
    }

    function anyOneCanCall() external {
        // code
    }
}
