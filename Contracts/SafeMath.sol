// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SafeMath {
    function testUnderFlow() public pure returns(uint256) {
        uint256 i;
        i--;
        return i;
    }

    function testUncheckedUnderFlow() public pure returns(uint256) {
        uint256 i;
        unchecked {
            i--;
        }
        return i;
    }
}