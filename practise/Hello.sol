// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Hello{
    string public hello = "hello!";

    function sayHello (string memory name) public view returns (string memory) {
        return sayHello2(name);
    }

    function sayHello2 (string memory name) private    view returns (string memory) {

        return string.concat(hello,name);
    }

    function contact(string memory a , string memory b) public  pure returns ( string memory) {
        return string.concat(a,b);
    }

    function sethello(string memory _hello) public returns (string memory) {
        hello = _hello;
        return hello;
    }
}