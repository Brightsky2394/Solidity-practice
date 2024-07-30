// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// interface IERC20 {
//     function totalSupply() external view returns (uint);
//     function balanceOf(address owner) external view returns (uint);
//     function transfer(address recipient, uint amount) external returns (bool);
//     function transferFrom(address sender, address recipient, uint amount) external returns (bool);
//     function approve(address spender, uint amount) external returns (bool);
//     function allowance(address owner, address spender) external returns (bool);

//     event Transfer(address indexed sender, address indexed recipient, uint amount);
//     event Approval(address indexed sender, address indexed recipient, uint amount);
// }

contract ERC20 {
    uint public totalSupply;
    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;
    string public name = "Yasky";
    string public symbol = "YSK";
    uint public decimal = 18;
    event Transfer(address sender, address recipient, uint amount);
    event Approval(address owner, address spender, uint amount);

    function transfer(address recipient, uint amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool) {
        allowance[sender][msg.sender] -= amount;
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
    }

    function burn(uint amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
    }
}
