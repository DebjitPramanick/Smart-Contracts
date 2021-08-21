pragma solidity 0.8.4;

contract AdvancedStorage{
    uint[] public ids;
    
    // Adding id to the array
    function add(uint id) public{
        ids.push(id);
    }
    
    // Getting id by passing particular position in the array
    function get(uint position) view public returns(uint){
        return ids[position];
    }
    
    // Getting all ids
    function getAll() view public returns(uint[] memory){
        return ids;
    }
    
    // Getting length of the array
    function getSize() view public returns(uint) {
        return ids.length;
    }
}