//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SendEth {

    constructor() payable  {}

    receive() external payable {}

    function sendByTransfer(address payable _to) external payable {
        _to.transfer(555);
    }

    function sendBSend(address payable _to) external payable {
        bool sent = _to.send(444);
        require(sent, "SEND FAILED");
    }

    function sendByCall(address payable _to) external payable {
        (bool success, ) = _to.call{value: 333}("");
        require(success, "CALL FAILED");
    }
}

contract EthReceiver {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}