//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/// @title Testing some Mapping
/// @author the_roqbell (milk-maid)
/// @notice see how structs work s
contract MappingsArray {

    mapping(uint => string[]) internal myMapping;

    function addValues(uint _key, string memory _word1, string memory _word2) external {
        myMapping[_key] = [_word1, _word2];
    }

    function getValues(uint _key) external view returns (string[] memory) {
        return myMapping[_key];
    }
}
