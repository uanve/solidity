//SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract Allowance {
    address owner;

    event allowanceUpdate(address indexed _forWho, address indexed _fromWhom, uint _oldAmount, uint _newAmount);

    constructor() {
        owner = msg.sender;
    }

    mapping(address => uint) public allowance;

    function _checkOwner() internal view returns(bool){
        return owner == msg.sender;
    }

    function _checkAllowance(uint _amount) internal view returns(bool){
        return _amount <= allowance[msg.sender];
    }

    modifier ownerOrAllowed(uint _amount) {
        require(_checkOwner() || _checkAllowance(_amount), "You are not allowed");
        _;
    }

    function setAllowance(address _to, uint _amount) public {
        require (_checkOwner(), "You are not the owner");
        emit allowanceUpdate(_to, msg.sender, allowance[msg.sender], _amount);
        allowance[_to] = _amount;
    }

}

contract SharedWallet is Allowance{
    event MoneySent(address indexed _beneficiary, uint _amount);
    event MoneyRecieved(address indexed _from, uint _amount);

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
            require (_amount <= address(this).balance, "There are not enough funds in Contract");
            if(!_checkOwner()){
                allowance[msg.sender] -= _amount;
            }
            emit MoneySent(_to, _amount);
            _to.transfer(_amount);
        }
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function Deposit() public payable {
        emit MoneyRecieved(msg.sender, msg.value);
    }
}