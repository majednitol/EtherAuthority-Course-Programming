// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract StudentRegistry {
    struct Student {
        string name;
        uint age;
        string email;
        string phone;
        string s_address;
    }
    mapping(address => Student) private students;

    function registerStudent(
        string memory _name,
        uint _age,
        string memory _email,
        string memory _phone,
        string memory _address
    ) public {
        students[msg.sender] = Student(_name, _age, _email, _phone, _address);
    }

    function getStudentInfo(
        address _studentAddress
    )
        public
        view
        returns (
            string memory,
            uint,
            string memory,
            string memory,
            string memory
        )
    {
        Student memory student = students[_studentAddress];
        return (
            student.name,
            student.age,
            student.email,
            student.phone,
            student.s_address
        );
    }
}
// contract address: 0x7FBb218BA92B7ff48b7ddcf053fECa6712C1fbAc