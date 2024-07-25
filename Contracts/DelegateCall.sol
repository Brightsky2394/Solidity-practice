// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestDelegateCall {
    address public sender;
    uint public value;
    uint public num;

    function setVars(uint _num) external payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract DelegateCall {
    address public sender;
    uint public value;
    uint public num;

    function setVars(address _testDelegateCall, uint _num) external payable {
        // (bool success, ) = _testDelegateCall.delegatecall(abi.encodeWithSignature("setVars(uint256)", _num));
        (bool success, ) = _testDelegateCall.delegatecall(
            abi.encodeWithSelector(TestDelegateCall.setVars.selector, _num)
        );
        require(success, "Delegate call failed");
    }
}
