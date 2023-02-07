//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MyEtherWallet {

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function sendFunds(uint _amount) external onlyOwner {
        payable(msg.sender).transfer(_amount);  //used this insread of owner to reduce gas ccst

        // (bool sent, ) = payable(msg.sender).call{value: _amount}("");
        // require(sent, "SEND FAILED");
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    //    {  "GIFT OUT CONTRACT OWNERSHIP"  }
    function changeWalletOwner( address _newOwner ) external onlyOwner {
        require( _newOwner != address(0), "INVALID ADDRESS");
        owner = payable(_newOwner);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "ONLY OWNER CAN DO THIS");

        _;
    }
    
}