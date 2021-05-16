pragma solidity 0.8.4;

contract CRUD{
    struct User{
        uint id;
        string name;
    }
    
    User[] public users;
    uint public nextId;
    
    function create(string memory name) public {
        users.push(User(nextId, name));
        nextId++;
    }
    
    function read(uint id) view public returns(uint, string memory) {
        uint pos = search(id);
        return(users[pos].id, users[pos].name);
    }
    
    function update(uint id, string memory name) public {
        uint pos = search(id);
        users[pos].name = name;
    }
    
    function destruct(uint id) public {
        uint pos = search(id);
        delete users[pos];
    }
    
    
    function search(uint id) view internal returns(uint){
        for(uint i=0;i<users.length;i++){
            if(users[i].id == id){
                return i;
            }
        }
        
        revert('User not found.');
    }
}
