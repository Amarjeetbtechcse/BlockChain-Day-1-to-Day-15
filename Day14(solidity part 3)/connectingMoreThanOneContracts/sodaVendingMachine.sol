// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./IsodaPrices.sol";

contract VendingMachine {
    uint soda;
    address owner;

    IsodaPrice public sodaAddress;

    constructor(address _sodaAddress) {
        soda = 100;
        owner = msg.sender;
        sodaAddress = IsodaPrice(_sodaAddress);
    }

    function buy() public payable {
        require(msg.value == sodaAddress.getPrice(), "You should have dynamically");
        require(soda > 0, "Out of stock");

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
