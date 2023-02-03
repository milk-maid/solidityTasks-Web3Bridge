//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/// @title A Simple Domain Naming Website
/// @author the_roqbell (milk-maid)
/// @notice to Generate Domain Names
contract DomainENS {

    struct Domain {
        uint id;
        string dName;
        address addr;
    }

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "NOT OWNER");

        _;
    }

    Domain[] public domains;

  /// @notice this Functions Assign the Domain Name
  /// @param _id the DomainName Index In Our Array
  /// @param _dName the Desired Domain Name
  /// @param _addr the Address Attached To The Domain
    function addDomain( uint _id, string memory _dName, address _addr) public onlyOwner {
        Domain memory newDomain = Domain(_id, _dName, _addr);
        domains.push(newDomain);

        emit fire(_dName, _addr, "Enjoy Your ENS"); 

    }

    /// @param _index the Index Of The Domain You Want To Check
    /// @return uint the Index Of The Domian
    /// @return string the Domain Name
    /// @return address the Domain Address
    function lookUpDomain(uint _index) onlyOwner public view returns(uint, string memory, address) {
        require(_index <= domains.length - 1, "INDEX NOT INCLUDED");
        Domain storage domain = domains[_index];
        return (domain.id, domain.dName, domain.addr);
    }

    /// @notice assign a new owner to the contract
    /// @param _newOwner the New Contract Owner
    function setOwner( address _newOwner ) external onlyOwner {
        require( _newOwner != address(0), "INVALID ADDRESS");
        owner = _newOwner;
    }

    /// @notice Reassign Name To An Address Domain
    /// @param _index the Domain Index
    /// @param _newDomainName The NewDomain Name to Be Assigned to That Index
    function ressignName( uint _index, string memory _newDomainName) external {
        require(_index <= domains.length - 1, "INDEX NOT INCLUDED");
        Domain storage domain = domains[_index];
        domain.dName = _newDomainName;

        emit fire(_newDomainName, msg.sender, "NAME CHANGED SUCCESSFULLY"); 
    } 

    // function listOfDomainNames() public view returns (uint, string memory, address) {
    //     for (uint i = 0; i < domains.length; i++) {
    //     // Domain storage domain = domains[i];
    //     return (domains[i].id, domains[i].dName, domains[i].addr);
    //     }
    //     // return (domain.id, domain.dName, domain.addr);
    // }


    /// @notice Delete A Specific Domain
    /// @param _index The Data To Delete
    function deleteDomain(uint _index) public {
        domains[_index] = domains[domains.length -1];
        domains.pop();
    }


    event fire(string name, address indexed addr, string output);
}