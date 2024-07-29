// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Kill {
    constructor() payable {}

    function kill() external {
        selfdestruct(payable(msg.sender));
    }

    function testCall(uint _num) external pure returns (uint) {
        return _num;
    }
}

contract Helper {
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    function kill(address _kill) external {
        Kill(_kill).kill();
    }
}
