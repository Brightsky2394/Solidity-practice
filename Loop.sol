// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForLoop {
    // compute sum of first n natuaral numbers
    function sumToNum(uint _num) external pure returns (uint) {
        uint sum;
        for (uint i = 1; i <= _num; i++) {
            sum += i;
        }
        return sum;
    }

    // compute the sum of even number from zero upward
    function sumEvenNumber(uint _num) external pure returns (uint) {
        uint evenPositiveSum;
        uint i;
        for (i = 0; i <= _num; i++) {
            if (i % 2 == 0) {
                evenPositiveSum += i;
            }
        }
        return evenPositiveSum;
    }

    // compute the sum first positive n odd numbers

    function sumOddNumber(uint _num) external pure returns (uint) {
        uint oddPositiveSum;
        for (uint j = 0; j <= _num; j++) {
            bool condition = j % 2 == 1;
            if (condition) {
                oddPositiveSum += j;
            }
        }
        return oddPositiveSum;
    }
}

contract WhileLoop {
    // compute sum of first n natuaral numbers
    function sumToNum(uint _num) external pure returns (uint) {
        uint sum;
        uint x;
        while (x <= _num) {
            sum += x;
            x++;
        }
        return sum;
    }

    // compute the sum of even number from zero upward

    function sumPositiveEven(uint _num) external pure returns (uint) {
        uint evenPositiveSum;
        uint i;
        while (i <= _num) {
            if ((i % 2 == 0)) {
                evenPositiveSum += i;
            }
            unchecked {
                i++;
            }
        }
        return evenPositiveSum;
    }

    // compute the sum first positive n odd numbers

    function sumOddNumber(uint _num) external pure returns (uint) {
        uint oddPositiveSum;
        uint j;
        while (j <= _num) {
            if (!(j % 2 == 0)) {
                oddPositiveSum += j;
            }
            unchecked {
                j = j + 1;
            }
        }
        return oddPositiveSum;
    }
}
