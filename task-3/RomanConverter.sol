// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RomanConverter {
    // 罗马字符到数值的映射
    mapping(bytes1 => uint256) private romanValues;
    
    constructor() {
        romanValues['I'] = 1;
        romanValues['V'] = 5;
        romanValues['X'] = 10;
        romanValues['L'] = 50;
        romanValues['C'] = 100;
        romanValues['D'] = 500;
        romanValues['M'] = 1000;
    }

    function romanToInt(string memory s) public view returns (uint256) {
        bytes memory str = bytes(s);
        uint256 total = 0;
        uint256 prevValue = 0;
        
        // 从右向左遍历处理减法规则
        for (uint256 i = str.length; i > 0; i--) {
            uint256 currentValue = romanValues[str[i-1]];
            if (currentValue < prevValue) {
                total -= currentValue;
            } else {
                total += currentValue;
            }
            prevValue = currentValue;
        }
        return total;
    }
}