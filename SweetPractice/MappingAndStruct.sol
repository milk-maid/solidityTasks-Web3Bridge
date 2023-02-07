//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/// @title Testing some Mapping
/// @author the_roqbell (milk-maid)
/// @notice see how structs work s
contract MappingAndStruct {

    struct Car {
        string brand;
        uint price;
    }

    mapping(uint => Car) internal myCarMapp;

    function addValues(uint _key, string memory _brand, uint _price) external {
        Car memory myVehicle = Car(_brand, _price);
        myCarMapp[_key] = myVehicle;
    }

    function getValues(uint _key) external view returns (Car memory) {
        return myCarMapp[_key];
    }
}
