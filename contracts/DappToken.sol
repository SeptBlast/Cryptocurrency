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

    // transfer
    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    // approve
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    // allowance
    mapping(address => mapping(address => uint256)) public allowance; //nested variable declaration

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

    // Delegates Transfer
    // Aprove
    function approve(address _spender, uint256 _value) public returns (bool success) {
        //allowance
        allowance[msg.sender][_spender] = _value;
        //approve events
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // Transfer from
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        //requirements _from have tokens
        require (_value <= balanceOf[_from]);
        // require allowance is big to transfer
        require(_value <= allowance[_from][msg.sender]);
        // change the balance
        // update the allowance 
        // call transfer event
        // retrun boolian
        return true;
    }
}