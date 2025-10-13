// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
创建一个名为Voting的合约，包含以下功能：
一个mapping来存储候选人的得票数
一个vote函数，允许用户投票给某个候选人
一个getVotes函数，返回某个候选人的得票数
一个resetVotes函数，重置所有候选人的得票数
*/
contract Voting{

    mapping(string =>uint256) public votes;
    string[] keys;
    function vote(string memory name) public {
        if(votes[name] == 0){
            keys.push(name);
        }
        uint256 count = votes[name];
        uint256 i = 1;
        votes[name] = count +i;
    } 

    function getVotes(string memory name ) public view returns (uint256){
        return votes[name];
    }   

    function resetVotes() public {
        for(uint i=0;i<keys.length;i++){
            string memory key = keys[i];
            votes[key] = 0;
        }
    }

    
}