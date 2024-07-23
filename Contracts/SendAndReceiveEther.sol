// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SendEther {
    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(msg.value);
        require(sent, "Send failed");
    }

    function sendViaCall(address payable _to) external payable {
        (bool success, ) = _to.call{value: msg.value}("");
        require(success, "Call failed");
    }
}

contract EthReceiver {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}
