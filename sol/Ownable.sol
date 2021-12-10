pragma solidity ^0.4.24;
contract Ownable {
    address public owner;//#A

    constructor() public {
        owner = msg.sender;//#B
    }

    modifier onlyOwner() {
        require(msg.sender == owner);//#C
        _;
    }
}