// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Store {
    // state variable
    uint testNum;
    bool testCondition;
    string testMessage;
    int testNegativeNum;

    // reset state variable testNum value
    function setTestNum(uint _testNum) public {
        testNum = _testNum;
    }

    // return the current value of testNum
    function getTestNum() public view returns (uint) {
        return testNum;
    }

    // set the state variable testCondition value
    function setTestCondition(bool _testCondition) public {
        testCondition = _testCondition;
    }

    // return current value of testCondition
    function getTestCondition() public view returns (bool) {
        return testCondition;
    }

    // reset the state variable testMessage value
    function setTextMessage(string memory _testMessage) public {
        testMessage = _testMessage;
    }

    // return current value of testMessage
    function getTestMessage() public view returns (string memory) {
        return testMessage;
    }

    // reset the state variable testNegativeNum value
    function setTestNegativeNum(int _testNegativeNum) public {
        testNegativeNum = _testNegativeNum;
    }

    // return current value of testNegativeNum
    function getTestNegativeNum() public view returns (int) {
        return testNegativeNum;
    }
}
