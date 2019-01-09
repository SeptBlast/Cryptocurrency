// for ERC20 Standard defination
pragma solidity ^0.5.0;

contract DappToken{
    uint256 public totalSupply;

    mapping(address => uint256) public balanceof;

    // Constructor
    //function DappToken() public {     // older way of defining cunstructor
    constructor (uint256 _initialSupply) public {
        balanceof[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;      //state variable
        // Allocation of Initial Supply

    }

    // Set the tockens up
    // Read total no tokens

}