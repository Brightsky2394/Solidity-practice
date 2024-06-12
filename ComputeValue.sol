// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ComputeValue {
    function add(int a, int b) external pure returns (int) {
        int sum = a + b;
        return sum;
    }

    function subtract(int a, int b) external pure returns (int) {
        int difference = a - b;
        return difference;
    }

    function multiply(int a, int b) external pure returns (int) {
        int product = a * b;
        return product;
    }

    function divide(int a, int b) external pure returns (int) {
        int quotient = a / b;
        return quotient;
    }
}

contract SignedExponentiation {
    function NumPower(int base, int exponent) external pure returns (int) {
        require(exponent >= 0, "Exponent must be non positive");
        if (base == 0 && exponent == 0) {
            revert("Operation is undefined");
        }

        int answer = 1;
        for (int i = 0; i < exponent; i++) {
            answer *= base;
        }
        return answer;
    }
}
