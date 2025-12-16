// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract InternshipTask {
    struct Intern {
        string name;
        uint256 age;
        string field;
    }
    struct Task {
        string taskName;
        bool isCompleted;
    }

    mapping(address => Intern) private interns;
    mapping(address => Task[]) private tasks;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    function registerIntern(
        address _internAddress,
        string memory _name,
        uint256 _age,
        string memory _field
    ) public onlyAdmin {
        interns[_internAddress] = Intern({
            name: _name,
            age: _age,
            field: _field
        });
    }

    function getIntern(
        address _internAddress
    )
        public
        view
        returns (string memory name, uint256 age, string memory field)
    {
        Intern storage intern = interns[_internAddress];
        return (intern.name, intern.age, intern.field);
    }

    function addTask(string memory _taskName) public onlyAdmin {
        tasks[msg.sender].push(Task({taskName: _taskName, isCompleted: false}));
    }

    function assignTask(
        address _internAddress,
        uint256 _taskIndex
    ) public onlyAdmin {
        require(_taskIndex < tasks[msg.sender].length, "Invalid task index");
        tasks[_internAddress].push(tasks[msg.sender][_taskIndex]);
    }

    function updateTaskStatus(
        address internAddress,
        uint256 _taskIndex,
        bool _isCompleted
    ) public onlyAdmin {
        require(_taskIndex < tasks[msg.sender].length, "Invalid task index");
        tasks[internAddress][_taskIndex].isCompleted = _isCompleted;
    }

    function getTask(
        uint256 _taskIndex
    ) public view returns (string memory taskName, bool isCompleted) {
        require(_taskIndex < tasks[msg.sender].length, "Invalid task index");
        Task storage task = tasks[msg.sender][_taskIndex];
        return (task.taskName, task.isCompleted);
    }
}
// contract address: 0xaF9fc5Ee69A9C24Ec8B3F68d7F451c10591Ceb7B