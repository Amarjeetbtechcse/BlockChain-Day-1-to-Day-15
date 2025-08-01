// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VendingMachine {
    uint soda;
    address owner;

    struct Customer {
        uint sodaCount;
        uint lastPurchased;
        bool vip;
    }

    // ✅ FIXED: Mapping stores Customer, not uint
    mapping (address => Customer) public sodaPurchased;

    constructor() {
        soda = 100;
        owner = msg.sender;
    }

    function buy() public payable {
        require(msg.value == 1 ether, "You should have 1 ether");
        require(soda > 0, "Out of stock");

        Customer storage c1 = sodaPurchased[msg.sender]; //here storage keyword used rather than memory and more due to it Refers to permanent storage on the blockchain

        c1.sodaCount++;
        if (c1.sodaCount == 5) {
            c1.vip = true;
        }

        c1.lastPurchased = block.timestamp;
        soda -= 1;
    }

    function fillSoda(uint _soda) public {
        require(msg.sender == owner, "You are not the owner");
        soda += _soda;
    }

    function withdrawBalance() public {
        require(msg.sender == owner, "You are not owner");
        payable(owner).transfer(address(this).balance);
    }

    function checkSoda() public view returns (uint) {
        return soda;
    }
}
