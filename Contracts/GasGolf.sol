// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GasGolf1 {
    uint256 public sum;
    // not gas optimized
    function isEvenAndLessThan99(uint256[] memory nums) external {
        uint256 i;
        for (i = 0; i < nums.length; i++) {
            bool isEven = nums[i] % 2 == 0;
            bool isLessThan99 = nums[i] < 99;
            if (isEven && isLessThan99) {
                sum += nums[i];
            }
            
        }
        sum;
    }
}

contract GasGolf2 {
    uint256 public sum;
    // gas optimized
    function isEvenAndLessThan99(uint256[] calldata nums) external {
        uint256 _sum = sum;
        uint256 i;
        uint256 len = nums.length;
        for (i = 0; i < len; ) {
            uint256 num = nums[i];
            if (num % 2 == 0 && num < 99) {
                _sum += num;
            }
            unchecked {
                ++i;
            }
        }
        sum = _sum;
    }

}