pragma solidity 0.8.4;

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;
    
    function mint() public {
        // Here tx.origin indicates the original sender 
        balances[tx.origin] += 1;
    }
}


contract Token{
    
    address payable wallet;
    address public token;
    
    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token = _token;
    }
    
    function buyToken() public payable {
        ERC20Token _token = ERC20Token(address(token));
        _token.mint();
        wallet.transfer(msg.value);
    }
}