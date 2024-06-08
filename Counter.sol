// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint256 numCount;

    // function to view count
    function get() public view returns (uint256) {
        return numCount;
    }

    // function that increment count
    function incrementCount() public {
        numCount++;
    }

    // function that decrement count
    function decrementCount() public {
        numCount--;
    }
}
