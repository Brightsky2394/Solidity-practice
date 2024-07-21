// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract TestContract1 {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner != msg.sender, "Not the owner");
        _;
    }

    function setOwner(address _owner) external onlyOwner {
        owner = _owner;
    }
}

contract TestContract2 {
    address public owner = msg.sender;
    uint public value = msg.value;
    uint public x;
    uint public y;

    constructor(uint _x, uint _y) payable {
        x = _x;
        y = _y;
    }
}

contract Proxy {
    event Deploy(address);

    fallback() external {}

    function deploy(bytes memory _code) external payable {
        address addr;
        assembly {
            addr := create(callvalue(), add(_code, 0x20), mload(_code))
        }
        require(addr != address(0), "Deployed failed");
        emit Deploy(addr);
    }

    function execute(address _target, bytes memory _data) external payable {
        (bool success, ) = _target.call{value: msg.value}(_data);
        require(success, "Execution failed");
    }
}

contract Helper {
    function getBytecode1() external pure returns (bytes memory byteCode) {
        byteCode = type(TestContract1).creationCode;
        return byteCode;
    }

    function getBytecode2(
        uint _x,
        uint _y
    ) external pure returns (bytes memory byteCode) {
        byteCode = type(TestContract2).creationCode;
        return abi.encodePacked(byteCode, abi.encode(_x, _y));
    }

    function getCalldata(address _owner) external pure returns () {
        return abi.encodeWithSignature("setOwner(address)", _owner);
    }
}
