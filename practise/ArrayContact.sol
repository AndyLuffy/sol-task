// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

contract ArrayContract{
    uint256[] public  list;
    uint256[] public list2 = [1,2,3];
    uint256[] public list3 = new uint[](6);

    bytes public  bs = "abc\x22\x22"; 
    bytes public _data = new bytes(10); 
    string str0; 
    string str1 = "TinyXiong\u718A";

    function readByte(uint256 index) public  view returns(bytes1 ){
        return bs[index];
    }

    function getbyteByvalue(bytes1 v) public view returns (uint256 ){

        for (uint256 i = 0 ; i<bs.length; i++) {
            if (bs[i] == v){
                return uint256(i);
            }
        }
        return 0;
    }
   


    function loopF() public returns(uint256[] memory){
        for (uint i = 0; i < list2.length; i++){
            list2[i] =  list2[i]+1;
        }
        list.push();
        return list2;
    }


    function readList() external view returns(uint[] memory , uint256){

        return ( list2, list2.length);
    }

    function loopN() public pure returns(uint ){

        uint  sum = 0;
        for (uint i = 0; i <10; i++){
            sum += i;
        }
        return sum;
    }
     function loopW() public pure returns(uint ){

        uint  sum = 0;
        uint i = 0;
        while (i<10){
            sum += i ;
            i++;
        }
    
        return sum;
    }

    function testSlice(bytes  calldata data , uint start , uint end) public pure returns(bytes memory){
        return data[start:end];
    }
}