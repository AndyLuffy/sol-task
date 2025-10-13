// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

contract MappingContract{
    
    mapping(address account => uint256 amount) public map ; 

    mapping(address => uint256) public balances;
    function setBalance(uint256 amount) public {
        balances[msg.sender] = amount;
    }
    function getBalance(address user) public view returns (uint256) {
        return balances[user];
    }

    function setMap(address key, uint256 value) public {
    
        map[key] = value; // map[key] is a storage reference]
    }

    mapping(address => mapping(string => uint256)) public userBalances;
    function setUserBalance(string memory currency, uint256 amount) public {
        userBalances[msg.sender][currency] = amount;
    }
    function getUserBalance(address user, string memory currency) public view returns (uint256) {
        return userBalances[user][currency];
    }

    function deleteUserBalance(address addr,string memory currency) public {
        delete userBalances[addr][currency];
    }

}