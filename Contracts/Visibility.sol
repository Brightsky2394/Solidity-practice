// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VisibilityBase {
    uint private x = 3;
    uint internal y = 1;
    uint public z = 2;

    function privateFunc() private pure returns (string memory) {
        return "Private function is callable";
    }

    function internalFunc() internal pure returns (string memory) {
        return "Internal function is callable";
    }

    function publicFunc() public pure returns (string memory) {
        return "Public function is callable";
    }

    function externalFunc() external pure returns (string memory) {
        return "Only callable by other external function";
    }

    function example()
        external
        view
        returns (
            uint sum,
            string memory res1,
            string memory res2,
            string memory res3
        )
    {
        sum = x + y + z;
        res1 = privateFunc();
        res2 = publicFunc();
        res3 = internalFunc();
        //  externalFunc(); This can only be called by an external function
        return (sum, res1, res2, res3);
    }
}

contract VisibilityChild is VisibilityBase {
    function computeSum()
        external
        view
        returns (uint sum, string memory res1, string memory res2)
    {
        sum = y + z;
        res1 = internalFunc();
        res2 = publicFunc();
        // externalFunc() is not callable by the child contract
        return (sum, res1, res2);
    }
}
