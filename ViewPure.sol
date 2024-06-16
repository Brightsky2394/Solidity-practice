// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ViewPure {
    uint256 numX = 6;

    function addXY(uint256 numY) public view returns (uint256) {
        uint256 sum = numX + numY;
        return sum;
    }

    function multiplyAB(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 product = a * b;
        return product;
    }
}
