// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

contract StructContract{

    struct Person{
        uint8 age;
        string name;

    }

    struct Hobby{
        string label;
        string value;

    }

    Person[] public users;

    function addPerson(Person calldata p) public {
        users.push(p);
    }

}