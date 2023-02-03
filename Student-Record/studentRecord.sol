//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/// @title A Simulation Of A Student Record Contract
/// @author the_roqbell (milk-maid)
/// @notice You Can Use This Contract To Store Basic Student Record
/// @dev There's Room For More Things
contract DomainENS {

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
    
    /// @notice This Function Will Store The Details Of The Student
    /// @param _name The Student Name
    /// @param _gender The Gender
    /// @param _age The Learner's Age
    function store_Details( string memory _name, string memory _gender, uint8 _age) public {
        studentDetail memory newStudent = studentDetail(_name, _gender, _age);
        studentDetails.push(newStudent);
    }

    /// @notice This Function Will Return The Student's Details
    /// @param _index The Index to lookup
    /// @return string The Learner's Name
    /// @return string The Learner's Gender
    /// @return age The Learner's Age
    function get_name(uint8 _index) public view returns(string memory, string memory, uint8) {
        require(_index <= studentDetails.length - 1, "NO STUDENT AT THIS INDEX! ENTER A LOWER NUMBER");
        studentDetail storage thisStudent = studentDetails[_index];
        return (thisStudent.Name, thisStudent.Gender, thisStudent.age);
    }

    /// @notice This Function Will Delete The Student's Details At Index '_index'
    /// @param _index The Index of the student value to be deleted
    function deleteDomain(uint _index) public {
        require(_index <= studentDetails.length - 1, "NO STUDENT AT THIS INDEX! ENTER A LOWER NUMBER");
        studentDetails[_index] = studentDetails[studentDetails.length -1];
        studentDetails.pop();
    }
}