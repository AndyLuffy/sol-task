// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

contract reverseString{

    function reverseString2(bytes memory str) public pure returns (bytes memory) {
    uint i = 0;
    uint j = str.length - 1;
    while (i < j) {
        str[i] = str[j];
        str[j] =str[i];
        i++;
        j--;
    }
    return str;
    }

}