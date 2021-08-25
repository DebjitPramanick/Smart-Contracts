pragma solidity ^0.7.0;

contract Voting{
    
    uint public cndIdx = 0;
    mapping(uint => Candidate) public candidates;
    mapping(address => uint) chances;
    
    function createCandidate(string memory name) public {
        cndIdx+=1;
        Candidate newCnd = new Candidate(name, cndIdx);
        candidates[cndIdx] = newCnd;
    }
    
    function voteFor(uint cndId) public{
        require(chances[msg.sender] != 1, "You cannot vote anymore.");
        Candidate cnd = candidates[cndId];
        cnd.increaseVote();
        chances[msg.sender] += 1;
    }
    
    function getCndInfo(uint _id) public returns(uint, string memory, uint){
        Candidate cnd = candidates[_id];
        return cnd.getInfo();
    }
    
    function getWinner() public returns(uint, string memory, uint){
        uint maxVotes = 0;
        uint winId = 0;
        for(uint i=1;i<=cndIdx;i++){
            Candidate cnd = candidates[i];
            if(maxVotes<cnd.getVoteCount()){
                maxVotes = cnd.getVoteCount();
                winId = i;
            }
        }
        Candidate cndWin = candidates[winId];
        return cndWin.getInfo();
    }
    
}

contract Candidate{
    string name;
    uint voteCount;
    uint id;
    
    constructor(string memory _name, uint _id) public{
        name = _name;
        id = _id;
        voteCount = 0;
    }
    
    function increaseVote() public {
        voteCount+=1;
    }
    
    function getVoteCount() public returns(uint){
        return voteCount;
    }
    
    function getInfo() public returns(
        uint,
        string memory,
        uint
    ){
        return(id, name, voteCount);
    }
}