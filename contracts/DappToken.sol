// for ERC20 Standard defination
// pragma solidity ^0.5.0;
pragma solidity >=0.4.22 <0.6.0;

contract DappToken{
    // Name
    string public name = "DApp Token";
    // Symbol
    string public symbol = "DAPP";
    // standard
    string public standard = "DApp Token v1.0";
    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;

    // Constructor
    //function DappToken() public {     // older way of defining cunstructor
    constructor (uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;      //state variable
        // Allocation of Initial Supply

    }

    // Transfer 
    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        // Exception if account has no sufficient balance
        require(balanceOf[msg.sender] >= _value, "Server Un-Authorized");
        //Transfer the balance
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        // Trigger a transfer event
        emit Transfer(msg.sender, _to, _value);
        // Boolean Return  
        return true;
    }
}