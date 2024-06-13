
// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;

contract Greeting {

    string private message;
    address private owner;

    event MessageChanged(string newMessage);

    constructor(string memory initialMessage) {
        owner = msg.sender;
        message = initialMessage;
        emit MessageChanged(initialMessage);
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can change the message");
        _;
    }

    function setMessage(string memory newMessage) public onlyOwner {
        message = newMessage;
        emit MessageChanged(newMessage);
    }

    function getMessage() public view returns (string memory) {
        return message;
    }
}
