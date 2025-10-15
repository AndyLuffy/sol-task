// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


// 实现银行接口的合约
contract Bank  {
    mapping(address => uint256) public balances;

    function withdrawTransfer() external {

        payable(msg.sender).transfer(1 ether);
    }

    function withdrawSender() external {
        bool success = payable(msg.sender).send(1 ether);
        require(success, "Send failed");
    }

     function withdrawCall() external {
        (bool success, bytes memory returnData ) = payable(msg.sender).call{value: 1 ether}("");
        require(success, "Call failed");
    }
    receive() external payable { }
    fallback() external payable { }
}

contract BankUser{
    Bank bank;
    constructor(address payable  addr){
        bank = Bank(addr);
    }

    function withdrawTransfer() external {

        bank.withdrawTransfer();
    }

    function withdrawSender() external {
         bank.withdrawSender();
    }

     function withdrawCall() external {
        bank.withdrawCall();
    }
    receive() external payable { }
    fallback() external payable { }
}

