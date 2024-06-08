// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OriginalContract {
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVariable(uint256 _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract Proxy {
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVariable(
        address _originalContract,
        uint256 _num
    ) public payable {
        (bool success, ) = _originalContract.delegatecall(
            abi.encodeWithSignature("setVariable(uint256)", _num)
        );
        require(success, "Delegate call failed");
    }
}
