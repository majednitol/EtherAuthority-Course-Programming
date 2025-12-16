// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Voting {
    struct Voter {
        string name;
        bool hasVoted;
    }
    struct Candidate {
        string name;
        uint voteCount;
    }
    mapping(address => Voter) private voters;
    Candidate[] private candidates;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    function registerVoter(
        address _voterAddress,
        string memory _name
    ) public onlyAdmin {
        voters[_voterAddress] = Voter({name: _name, hasVoted: false});
    }

    function addCandidate(string memory _name) public onlyAdmin {
        candidates.push(Candidate({name: _name, voteCount: 0}));
    }

    function vote(uint _candidateIndex) public {
        Voter storage sender = voters[msg.sender];
        require(
            bytes(sender.name).length != 0,
            "You are not registered to vote"
        );
        require(!sender.hasVoted, "You have already voted");
        require(_candidateIndex < candidates.length, "Invalid candidate index");

        sender.hasVoted = true;
        candidates[_candidateIndex].voteCount += 1;
    }

    function getCandidate(
        uint _index
    ) public view returns (string memory name, uint voteCount) {
        require(_index < candidates.length, "Invalid candidate index");
        Candidate storage candidate = candidates[_index];
        return (candidate.name, candidate.voteCount);
    }

    function getTotalCandidates() public view returns (uint) {
        return candidates.length;
    }

    function getVoterInfo(
        address _voterAddress
    ) public view returns (string memory name, bool hasVoted) {
        Voter storage voter = voters[_voterAddress];
        return (voter.name, voter.hasVoted);
    }
}
// contract address: 0x7b5d8314FE5D14796F7398E045fC56fBeDd99326