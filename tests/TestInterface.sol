// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
// 定义一个简单的接口
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}