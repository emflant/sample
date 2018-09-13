pragma solidity ^0.4.24;

contract Note {

    string public message;

    function write(string _message) public {
        message = _message;
    }

    function showMessage() public view returns (string) {
        return message;
    }
}