// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ABI{
    //获取当前函数的签名

    function getSelecter() public pure returns(bytes4){
         return msg.sig;
    }

    function compSelect(string memory fun) public  pure returns(bytes4){
        return bytes4(keccak256(bytes(fun)));
    }

    function hash(string memory input) public  pure returns (bytes32){
        return keccak256(abi.encodePacked(input));
    }

    
}