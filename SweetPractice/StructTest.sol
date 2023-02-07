//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/// @title Testing some Struct
/// @author the_roqbell (milk-maid)
/// @notice see how structs work s
contract StructTest {
    struct Car {
        string brand;
        uint price;
    }

    Car internal  myVehicle;

    function createVar(string memory _brand, uint _price) external {
        myVehicle = Car(_brand, _price);
    }

    function getVar() external view returns (Car memory) {
        return myVehicle;
    }
}