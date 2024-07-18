// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract Calculator {
    function add(int a, int b) public pure virtual returns (int);

    function subtract(int a, int b) public pure virtual returns (int);

    function multiply(int a, int b) public pure virtual returns (int);

    function divide(int a, int b) public pure virtual returns (int);
}

contract Compute is Calculator {
    function add(int a, int b) public pure override returns (int) {
        return a + b;
    }

    function subtract(int a, int b) public pure override returns (int) {
        return a - b;
    }

    function multiply(int a, int b) public pure override returns (int) {
        return a * b;
    }

    function divide(int a, int b) public pure override returns (int) {
        return a / b;
    }
}
