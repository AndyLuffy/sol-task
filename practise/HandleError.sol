// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

contract HandleError{

// 简单错误（不带参数）
error Unauthorized();

// 带参数的错误
error InsufficientBalance(uint256 available, uint256 required);

// 复杂参数的错误
error TransferFailed(address from, address to, uint256 amount, string reason);

    function requireErr( bool a) public pure returns (uint256){
        require(a,"is not true");
        return 1;
    }

    function assertErr(bool b) public pure returns(uint256){
        assert(b);
        return 1;
    }

    function revertErr(bool c) public pure returns (uint256){
        if(!c){
            revert Unauthorized();
        }
        return 2;
    }


}