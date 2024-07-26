// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Math {
    function max(uint x, uint y) internal pure returns (uint) {
        return x >= y ? x : y;
    }
}

contract TestMax {
    function testMax(uint x, uint y) external pure returns (uint) {
        return Math.max(x, y);
    }
}

library ArrayLib {
    function find(uint[] storage arr, uint x) internal view returns (uint i) {
        for (i = 0; i < arr.length; i++) {
            if (arr[i] == x) {
                return i;
            }
        }
        revert("Number not found");
    }
}

contract Array {
    using ArrayLib for uint[];
    uint[] public arr = [2, 1, 3];

    function testFind(uint _num) external view returns (uint) {
        // return ArrayLib.find(arr, _num);
        return arr.find(_num);
    }
}
