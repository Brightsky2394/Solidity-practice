// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Account {
    address public bank;
    address public owner;

    constructor(address _owner) {
        owner = _owner;
        bank = msg.sender;
    }
}

contract AccountFactory {
    Account[] public accounts;

    function createAccount(address _owner) external payable {
        Account account = new Account(_owner);
        accounts.push(account);
    }

    function getAccountsLength() external view returns (uint) {
        return accounts.length;
    }
}
