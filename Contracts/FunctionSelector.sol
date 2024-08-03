// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionSelector {
    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func))); //0xa9059cbb
    }
}

contract Receiver {
    event Log(bytes data);

    function transfer(
        address recipient,
        uint amount
    ) external returns (address, uint) {
        emit Log(msg.data); //0xa9059cbb0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc40000000000000000000000000000000000000000000000000000000000000017
        return (recipient, amount);
    }
}
