// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Demo{
    function Test() public {

    }

     function getBlockDetails() public view returns (uint, uint) {
        return (block.number, block.timestamp);
    }

    function getTxOrigin() public view returns (address) {
        return tx.origin;
    }
}