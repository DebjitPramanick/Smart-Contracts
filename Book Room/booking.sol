pragma solidity ^0.5.0;

contract HotelRoom{

    // Payment with ether in smart contract
    // Use of enum
    // USe of modifiers
    // Require statement
    
    enum Statuses { Vacant, Occupied }
    Statuses curStatus;
    
    address payable public owner;
    
    constructor() public {
        owner = msg.sender;
        curStatus = Statuses.Vacant;
    }
    
    modifier isVacant{
        require(curStatus == Statuses.Vacant, 'Currently Occupied.');
        _;
    }
    
    modifier isCost(uint amount){
        require(msg.value>=amount, 'Not enough ether.');
        _;
    }
    
    function book() payable public isVacant isCost(2 ether){
        curStatus = Statuses.Occupied;
        owner.transfer(msg.value);
    }
}
