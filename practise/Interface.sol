// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

// 定义一个简单的接口
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract ERC20 is IERC20{
    function transfer(address to, uint256 amount) external returns (bool){
        payable (to).transfer(amount);
        return false;
    }
    function balanceOf(address account) external   view returns (uint256){
        return account.balance;
    }
}


contract MyContract {
    // 使用接口与另一个合约交互
    function transferToken(address tokenAddress, address to, uint256 amount) public returns (bool) {
        IERC20 token = IERC20(tokenAddress);
        return token.transfer(to, amount);
    }

    // 获取代币余额
    function getTokenBalance(address tokenAddress, address account) public view returns (uint256) {
        IERC20 token = IERC20(tokenAddress);
        return token.balanceOf(account);
    }
}
