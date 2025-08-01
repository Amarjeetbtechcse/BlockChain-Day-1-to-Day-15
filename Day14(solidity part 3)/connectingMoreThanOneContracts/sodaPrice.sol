// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./IsodaPrices.sol";

contract SodaPrice is IsodaPrice{
    address public owner;
    uint public price;

    constructor() {
        owner = msg.sender;
        price = 1 ether;
    }

    function getPrice() external view returns(uint){
        return price;
    }

    function setPrice(uint _price) public {
        require(msg.sender == owner,"Only owner can set the price");
        price = _price;
    }
}