pragma solidity 0.8.4;

contract Names{
    
    Name[] public names;
    
    struct Name {
        uint id;
        string name;
    }

    uint count = 0;

    // Here onlyOwner is a modifier which detects if the current address is owener's address
    address owner;
    modifier onlyOwner(){
        require(msg.sender == owner); // msg.sender returns current user's address
        _;
    }

    // Here onlyOpen is a modifier which detects if the current timestamp is greater than unix epoch time
    uint openTime = 1622019729;
    modifier onlyOpen(){
        require(block.timestamp >= openTime);
        _;
    }

    constructor() {
        owner = msg.sender;
    }
    
    event Increment(uint value);
    event Decrement(uint value);
    
    function addName(string memory _name) public onlyOwner{ // This function can be executed by only owner
        incrementId();
        names.push(Name(count, _name));
    }


    function getName(uint _id) view public returns(uint, string memory) {
        return(names[_id].id, names[_id].name);
    }
    
    // internal will not expose the function or variable like public
    function incrementId() internal {
        count++;
    }
    
}