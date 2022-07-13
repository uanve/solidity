// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ExceptionExample {

    mapping(address => uint64) public balanceReceived;

    function sendMoney() public payable {
        balanceReceived[msg.sender] += uint64(msg.value);
    }

    function withdrawMoney(address payable _to, uint64 _amount) public {
        require (_amount <= balanceReceived[msg.sender], "Not Enough funds");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}