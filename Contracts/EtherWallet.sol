// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external {
        require(owner == msg.sender, "Caller is not owner");
        owner.transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
