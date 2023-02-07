//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/// @title Testing some Mapping
/// @author the_roqbell (milk-maid)
/// @notice see how structs work s
contract MappingsTest {
    mapping(uint => string) internal myMap;

    function addValues(uint _num, string memory _word) external {
        myMap[_num] = _word;
    }

    function getValues(uint _keyDataType) external view returns (string memory) {
        return myMap[_keyDataType];
    }
}
