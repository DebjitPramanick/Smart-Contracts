pragma solidity ^0.5.0;


contract Ownable{
    address owner;
    
    constructor() public{
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, 'Must be owner');
        _;
    }
}


contract SecretVault{
    
    string secret;
    
    constructor(string memory _s) public {
        secret = _s;
        super;
    }
    
    function getSecret() public view returns(string memory){
        return secret;
    }
}

contract MyContract is Ownable{
    
    address secretVault;
    
    constructor(string memory _s) public {
        SecretVault _sv = new SecretVault(_s);
        secretVault = address(_sv);
        super;
    }
    
    function getSecret() public view onlyOwner returns(string memory){
        SecretVault _sv = SecretVault(secretVault);
        return _sv.getSecret();
    }
}
