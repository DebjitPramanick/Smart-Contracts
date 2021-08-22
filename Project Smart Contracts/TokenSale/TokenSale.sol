pragma solidity ^0.7.0;

contract TokenSale{
    
    string public tokenName = "Meruem Coin";
    string public symbol = "MUC";
    uint256 public totalSuply;
    address payable public owner;
    mapping(address => uint256) public balanceOf;
    
    constructor(){
        owner = msg.sender;
        totalSuply = 1000000;
        balanceOf[owner] = totalSuply;
    }
    
    event BuyToken(address buyer, uint tokens);
    event BuyProduct(address buyer, uint tokens);
    event TransferToken(address sender, address recipient, uint tokens);
    
    modifier isNotOwner(){
        require(msg.sender != owner, "Owner cannot buy token from himself.");
        _;
    }
    
    modifier isMin(){
        require(msg.value >= 2 ether, "Minimum amount to buy tokens is 2 Ether.");
        _;
    }
    
    /* For Buying Token */
    function buyToken()  
    public
    payable 
    isNotOwner 
    isMin 
    {
        uint eth = msg.value/10**18;
        require(totalSuply >= eth*50, "Sorry, not enough supply is is available.");
        balanceOf[msg.sender] += eth*50;
        totalSuply = totalSuply - eth*50;
        balanceOf[owner] = totalSuply;
        emit BuyToken(msg.sender, eth*50);
    }
    
    /* For Transfering Token */
    function transferToken(address recipient, uint tokenNums) 
    public 
    payable 
    {
        require(recipient != owner, "You cannot send tokens to owner.");
        balanceOf[msg.sender] -= tokenNums;
        balanceOf[recipient] += tokenNums;
        emit TransferToken(msg.sender, recipient, tokenNums);
    }
    
    /* For Buying Products With Token */
    function buyUsingToken(uint reqTokens) 
    public 
    {
        require(balanceOf[msg.sender] >= reqTokens, "You don't have enough tokens.");
        balanceOf[msg.sender] -= reqTokens;
        totalSuply += reqTokens;
        balanceOf[owner] = totalSuply;
        emit BuyProduct(msg.sender, reqTokens);
        
    }
}
