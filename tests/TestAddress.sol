// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract TestAddress{


    // 获取地址的余额
    function getBalance(address addr) public view returns (uint256) {
        return addr.balance;
    }

    // 向地址转账
    function sendEther(address payable recipient) public payable {
        recipient.transfer(msg.value);
    }

    // 调用地址的代码（低级别调用）
    function callContract(address addr, bytes memory data) public returns (bool, bytes memory) {
        (bool success, bytes memory result) = addr.call(data);
        return (success, result);
    }

    

}