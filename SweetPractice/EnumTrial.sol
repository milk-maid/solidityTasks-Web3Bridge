//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Enum {
    enum ShippingStatus {
        None,       //0 //& will be the default value as per the first element
        Pending,    //1
        Shipped,    //2
        Impounded,  //3
        Completed,  //4
        Rejected,   //5
        Cancelled   //6
    }

    ShippingStatus public status;

    struct Order {
        address buyer;
        ShippingStatus status;
    }

    Order[] public orders;

    function get() view external returns(ShippingStatus) {
        return status;
    }

    function set(ShippingStatus _status) external {
        status = _status;
    } 

    function ship() external {
        status = ShippingStatus.Shipped;
    }

    function reset() external {
        delete status;
    }
}