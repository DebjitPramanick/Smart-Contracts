pragma solidity 0.8.4;

contract Token{
    
    mapping(address => uint256) public balances;
    address payable wallet;
    
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }
    
    function buyToken() public payable {
        // Buy a token
        balances[msg.sender] += 1;
        // Send ether to wallet
        wallet.transfer(msg.value);
    }
}