// for ERC20 Standard defination

pragma solidity ^0.5.0;

contract DappToken{
    uint256 public totalSupply;

    // Constructor
    //function DappToken() public {     // older way of defining cunstructor
    constructor () public {
        totalSupply = 1000000;      //state variable    
    }

    // Set the tockens up
    // Read total no tokens

}