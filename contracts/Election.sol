// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

contract Election {
    // Model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    // Store Candidates
    // Fetch Candidate
    mapping(uint => Candidate) public candidates;

    // Store accounts that have voted
    mapping(address => bool) public voters;
    // Store Candidates count
    uint public candidatesCount;


    string public candidate;
    // Constructor
    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string memory _name) private {
        candidatesCount ++ ;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]); // if the condition in rquire is true then function will execute else not
        // require a valid candidate
        require(_candidateId >0 && _candidateId<= candidatesCount);
        // record that voter has voted
        voters[msg.sender] = true;

        candidates[_candidateId].voteCount ++ ;
    }


}