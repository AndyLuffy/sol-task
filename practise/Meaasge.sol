// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

contract Message{

     function getMessageDetails() public payable returns (address, uint) {
        return (msg.sender, msg.value);
    }
    function getContractDetails() public view returns (address, uint) {
        return (address(this), address(this).balance);
    }
    function getContractBablane() public view returns (uint) {
        return address(this).balance;
    }

    function getContractAddress() public view returns (address) {
        return address(this);
    }

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
}