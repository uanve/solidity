// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract WorkingWithVariables {
    uint256 public myUint;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    bool public myBool;

    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }

    uint8 public myUint8;

    function incrementUint() public {
        myUint++;
    }

    function decrementUint() public {
        myUint--;
    }

    address public myAddress;

    function setAddress(address _address) public {
        myAddress = _address;
    }

    function getBalanceOfAddress() public view returns(uint) {
        return myAddress.balance;
    }

    string public myString = "hello world";

    function setMyString(string memory _myString) public {
        myString = _myString;
    }

}