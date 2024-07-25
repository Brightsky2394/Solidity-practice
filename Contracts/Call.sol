// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestCall {
    string public message;
    uint public x;
    event Log(string message);

    receive() external payable {
        emit Log("Receive function is called");
    }

    fallback() external payable {
        emit Log("Fallback function is called");
    }

    function foo(
        string memory _message,
        uint _x
    ) external payable returns (string memory, uint) {
        message = _message;
        x = _x;
        return (_message, _x);
    }
}

contract Call {
    bytes public data;

    function callFoo(
        address _testCall,
        string memory _message,
        uint _x
    ) external payable {
        (bool success, bytes memory _data) = _testCall.call{value: msg.value}(
            abi.encodeWithSignature("foo(string,uint256)", _message, _x)
        );
        require(success, "Call failed");
        data = _data;
    }

    function callDoesNotExist(address _testCall) external {
        (bool success, ) = _testCall.call(
            abi.encodeWithSignature("doesNotExist()")
        );
        require(success, "Call failed");
    }
}
