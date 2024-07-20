// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IterableMapping {
    mapping(address => uint) public balance;
    mapping(address => bool) public inserted;
    address[] public keys;

    function set(address _key, uint _val) external {
        balance[_key] = _val;
        if (!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    function get() external view returns (uint) {
        return keys.length;
    }

    function getFirst() external view returns (address) {
        return keys[0];
    }

    function getLast() external view returns (address) {
        return keys[keys.length - 1];
    }
}
