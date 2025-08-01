//PRACTICE THESE CODE

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract MyFavoriteNumber {
    uint public myNumber = 10;
    uint check = 100;

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier myOwner(){
        require(msg.sender == owner, "Only owner can change status");
    _;
    }

    string public myStatus = "Learning Solidity";
    // This is our new function!
    function setMyNumber(uint _myNumber) public {
        require(myNumber < _myNumber, "Number can't be set to low value");

        myNumber = _myNumber;
    }

    function setMyStatus(string memory _myStatus) public myOwner{
        // require(msg.sender == owner, "Only owner can change status");

        myStatus = _myStatus;
    }

    function checking() public view returns (uint) {
        return check;
    }

    function hitlist () public pure returns (uint) {
        return 200;
    }
    function sum(uint _num) public pure returns(uint){
        uint total = 0;

        for(uint i=1; i<=_num; i++){
            total += i;
        }
        return total; 
    }   
}















//PRACTICE THESE CODE


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract TipJar {

    string public status = "HELLO SOLIDITY AMARJEET";
    address public owner;

    constructor() {
        owner = msg.sender;
    }
    // We can see how much Ether is stored in this contract
    function getBalance() public view returns (uint) {
        // 'address(this).balance' is a special property that
        // gives the Ether balance of the current contract.
        return address(this).balance;
    }

    function setMyStatus(string calldata _status) public payable {
        require(msg.value == 1 ether, "Amount should be only one ehter exactly");

        status = _status;
    }

    function withdraw() public {
        require(msg.sender==owner, "You are not a owner");

        payable (owner).transfer(address(this).balance);
    }

    // This is a payable function. Anyone can call it and send Ether.
    function sendTip() public payable {
        // The function body can be empty! Its only job is to
        // receive the Ether.
    }
}

















//MAKING SAMART CONTRACT OF VENDING MACHINE OF SODA

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VendingMachine{
    uint soda ;
    address owner;

    constructor(){
        soda = 100;
        owner = msg.sender;

    }

    function buy() public payable {
        require(msg.value == 1 ether, "You should have 1 ether");

        require(soda > 0, "Out of stock");
        soda = soda - 1;
    }

    function fillSoda(uint _soda) public {
        require(msg.sender == owner, "You are not the ownere");
        soda = soda + _soda;
    }

    function withdrwBalance() public {
        require(msg.sender== owner, "You are not owner");

        payable (owner).transfer(address(this).balance);
    }

    function checkSoda() public view returns(uint) {
        return soda;
    }
}