pragma solidity 0.8.4;

contract SimpleStorage{
    string public data = 'mydata';
    
    function setData(string memory info) public {
        data = info;
    }
    
    function getData() view public returns(string memory){
        return data;
    }
}
