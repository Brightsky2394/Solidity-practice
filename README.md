# Solidity Practice

## Create Token

#### The following is consider in the writing of CreateToken.sol

- declare public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
- create a mapping of addresses to balances (address => uint)
- create a mint function that takes two parameters: an address and a value. The function increases the total supply by that number and increases the balance of the “sender” address by that amount
- create a burn function, which works opposite to the mint function, as it will destroy tokens. It will take an address and value just like the mint functions. It will then deduct the value from the total supply and from the balance of the “sender”.
- burn function must have conditionals to make sure the balance of "sender" is greater than or equal to the amount that is supposed to be burned.

## Test

- Deployed the contract on Remix IDE to check out the functionality of the contract.
