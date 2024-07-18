// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract VendingMachine {
    address payable owner = payable(msg.sender);

    function withdraw() public {
        if (owner != msg.sender) {
            revert("Error");
        }
        owner.transfer(address(this).balance);
    }
}
