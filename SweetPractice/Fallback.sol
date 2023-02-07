//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


/// Fallback: A Function that Is called when
/// the function you're calling doesn't exist
/// It enables direct sending Ether
contract Fallback {

    event Log(string funct, address sender, uint value, bytes data);

    fallback() external payable {
        emit Log("Fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable{
        emit Log("Receive", msg.sender, msg.value, "");
    }
}