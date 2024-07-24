// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CallTestContract {
    function callSetX(address _test, uint _x) external {
        TestContract(_test).setX(_x);
    }

    function callGetX(TestContract addr) external view returns (uint x) {
        x = addr.getX();
        return x;
    }

    function callSetXandSendEther(address _test, uint _x) external payable {
        TestContract(_test).setXandSendEther(_x);
    }

    function callGetXandValue(
        TestContract addr
    ) external view returns (uint _x, uint _value) {
        (_x, _value) = addr.getXandValue();
    }
}

contract TestContract {
    uint public x;
    uint public value = 321;

    function setX(uint _x) external {
        x = _x;
    }

    function getX() external view returns (uint) {
        return x;
    }

    function setXandSendEther(uint _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXandValue() external view returns (uint, uint) {
        return (x, value);
    }
}
