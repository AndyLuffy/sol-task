// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

contract Caller{
    function testMsg() public  view returns(address) {
        return msg.sender;
    }
    function testTx() public view returns(address){
        return tx.origin;
    }
}

contract Callee{
    Caller caller;
    // 0x6E111eaf89bbfC1210F413f63f0A35D34a75243f
    //0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

    constructor(){
        caller = new Caller();
    }

     function testMsg() public  view returns(address) {
        return caller.testMsg();
    }
    function testTx() public view returns(address){
        return caller.testTx();
    }


}