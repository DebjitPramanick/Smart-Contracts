pragma solidity 0.8.4;

contract Counter{

    // Declaring count variable
    uint count = 0;
    
    // Declaring events
    event Increment(uint value);
    event Decrement(uint value);


    // Declaring getCount function to get the current value of count
    function getCount() view public returns(uint) {
        return count;
    }
    
    // Declaring increment function to increase the current value of count by 1
    function increment() public {
        count = count + 1;
        emit Increment(count);
    }

    // Declaring decrement function to decrease the current value of count by 1
    function decrement() public {
        count = count - 1;
        emit Increment(count);
    }
}