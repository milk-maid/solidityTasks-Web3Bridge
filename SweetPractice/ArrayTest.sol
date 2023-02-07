//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/// @title Trying out some Array
/// @author the_roqbell (milk-maid)
/// @notice to Generate Domain Names
contract ArrayTest {
    bytes32 public stateVar = "validium";

    bytes32[] internal theArr = [bytes32("Hydrogen"), bytes32("Helium"), bytes32("Lithium"), bytes32("Berrylium")];

    function getArr() external view returns (bytes32[] memory) {
        return theArr;
    }

    function updatearr() external {
        theArr[1] = "kiwi";
    }
}