// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PiggyBank {
    address public owner = msg.sender;
    event Deposit(uint _amount);
    event Withdraw(uint _amount);

    modifier onlyOwner() {
        require(owner == msg.sender, "Not the owner");
        _;
    }

    receive() external payable {
        emit Deposit(msg.value);
    }

    function withdraw() external onlyOwner {
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}
