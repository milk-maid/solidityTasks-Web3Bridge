//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/// @title A Simulator for A Domain Naming Site
/// @author Bello Roqeeb (the_roqbell)
/// @notice this contract can be used for basic naming simulation
/// @dev The Contract Was Running Good At This moment
contract myENS {

    struct Register {
        address addr;
        string oName;
    }

    Register public register;
    // Register[] public registers;

    mapping( address => Register) public registeredNames;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "NOT OWNER");

        _;
    }

    /// @param name your Function Domain Name
    /// @param addr The Function Address
    /// @param message Tne Message To Be Fired
    event fire(string indexed name, address indexed addr, string message);

    /// @notice A Function To Add DomainName
    /// @param desiredName Your Desired Domain Name
    /// @param _yourAddr The Attached Domain Address
    function addName ( string memory desiredName, address _yourAddr ) public onlyOwner {
        require( _yourAddr != address(0), "INVALID ADDRESS");
        Register storage saveTHIS = registeredNames[_yourAddr];
        saveTHIS.addr = _yourAddr;
        saveTHIS.oName = desiredName;

        emit fire(desiredName, _yourAddr, "Enjoy Your ENS"); 
    }
    
    /// @notice Changes The Contract Ownership
    /// @param toWhom The Newly assigned Owner
    /// @param _newOwner The New Owner's Address
    function setOwner( string memory toWhom, address _newOwner ) external onlyOwner {
        require( _newOwner != address(0), "INVALID ADDRESS");
        // Register storage saveTHIS = registeredNames[_newOwner];
        owner = _newOwner;

        emit fire( toWhom , _newOwner, "TAKE RESPONSIBILITY");
    }

    function anyOneCall() external {
        //CODE
    }
}