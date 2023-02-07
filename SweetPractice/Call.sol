//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TestCall {
    string public message;
    uint public x;

    event Log(string message);

    fallback() external payable {
        emit Log("FALLBACK WA CALLED");
    }

    function foo(string memory _message, uint _x) external payable returns (bool, uint) {
        message = _message;
        x = _x;
        return (true, 222);
    }
}

contract Call {
    bytes public data;
    function callFoo(address _test) external payable {
        (bool success, bytes memory _data) = _test.call{value: 111}(abi.encodeWithSignature("foo(string,uint256)", "call foo", 123));
        require(success, "CALL FAILED");
        data = _data;
    }

    function callDoesNotExixt(address _test) external {
        (bool success, ) = _test.call(abi.encodeWithSignature("doesNotExist()"));
        require(success, "CALL FAILED");
    }
}