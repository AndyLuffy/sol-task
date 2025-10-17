// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

contract mergeArray{

     function mergeSortedArrays(uint[] memory a, uint[] memory b) public pure returns (uint[] memory) {
        uint[] memory merged = new uint[](a.length + b.length);
        uint i = 0;
        uint j = 0;
        uint k = 0;

        while (i < a.length && j < b.length) {
            if (a[i] < b[j]) {
                merged[k++] = a[i++];
            } else {
                merged[k++] = b[j++];
            }
        }

        while (i < a.length) {
            merged[k++] = a[i++];
        }

        while (j < b.length) {
            merged[k++] = b[j++];
        }

        return merged;
    }

}