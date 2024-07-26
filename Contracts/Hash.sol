// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HashFunc {
    function hash(
        string memory _text,
        uint _num,
        address _addr
    ) external pure returns (bytes32) {
        return keccak256(abi.encode(_text, _num, _addr));
    }

    function encodePack(
        string memory text1,
        string memory text2
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text1, text2));
    }

    function encode(
        string memory text1,
        string memory text2
    ) external pure returns (bytes32) {
        return keccak256(abi.encode(text1, text2));
    }

    function collision(
        string memory text1,
        string memory text2
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text1, text2));
    }

    // To avoid collision with encodePacked embed a type in between dynamic data type
    function avoidCollision(
        string memory text1,
        bool check,
        string memory text2
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text1, check, text2));
    }
}
