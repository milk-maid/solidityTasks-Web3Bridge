//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract StudentDetail {

    struct studentDetail {
        string Name;
        string Gender;
        uint8 age;
    }

    address public admin_address;

    constructor() {
        admin_address = msg.sender;
    }

    studentDetail[] public studentDetails;

    function store_Details( string memory _name, string memory _gender, uint8 _age) public {
        studentDetail memory newStudent = studentDetail(_name, _gender, _age);
        studentDetails.push(newStudent);
    }

    function get_name(uint8 _index) public view check_this(_index) returns(string memory, string memory, uint8) {
        studentDetail storage thisStudent = studentDetails[_index];
        return (thisStudent.Name, thisStudent.Gender, thisStudent.age);
    }

    function deleteStudent(uint _index) public check_this(_index) {
        studentDetails[_index] = studentDetails[studentDetails.length -1];
        studentDetails.pop();
    }

    modifier check_this(uint _index) {
        require(_index <= studentDetails.length - 1, "NO STUDENT AT THIS INDEX! ENTER A LOWER NUMBER");

        _;
    }
}