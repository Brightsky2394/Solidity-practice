// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Event {
    event Log(address, uint);
    event LogIndexed(address, string);

    function example(string calldata _name, uint _num) external {
        emit Log(msg.sender, _num);
        emit LogIndexed(msg.sender, _name);
    }

    event Message(address indexed from, address indexed to, string message);

    function SendMessage(string memory _message, address _to) external {
        emit Message(msg.sender, _to, _message);
    }
}
