//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/// @title Testing some Struct
/// @author the_roqbell (milk-maid)
/// @notice see how structs work s
contract StructArrayTest {
    struct Moto {
        string brand;
        uint price;
    }

    Moto[] internal  myVehicle;

    function createVar(string memory _brand, uint _price) external {
        Moto memory firstCar = Moto(_brand, _price);
        myVehicle.push(firstCar);
    }

    function getVar() external view returns (Moto[] memory) {
        return myVehicle;
    }
}
