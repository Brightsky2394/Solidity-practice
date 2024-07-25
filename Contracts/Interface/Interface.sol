// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICounter {
    function count() external view returns (uint);

    function incr() external;

    function decr() external;
}

contract CallInterface {
    uint public count;

    function increment(address _counter) external {
        ICounter(_counter).incr();
        count = ICounter(_counter).count();
    }

    function decrement(ICounter _counter) external {
        _counter.decr();
        count = _counter.count();
    }
}
