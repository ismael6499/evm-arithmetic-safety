//SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.24;

contract Calculator{

    uint256 public result = 1;

    modifier checkMaxPowerNumber(uint256 _num1){
        if(_num1 > 10) revert();
        _;
    }

    modifier checkNotZero(int256 _num1){
        if (_num1 == 0) revert();
        _;
    }

    event Addition(uint256 num1, uint256 num2, uint256 result);
    event Substraction(int256 num1, int256 num2, int256 result);

    function add(uint256 _num1, uint256 _num2) public returns(uint256 _result) {
        _result = _num1+_num2;
        emit Addition(_num1, _num2, _result);
    }

    function substract(int256 _num1, int256 _num2) public returns (int256 _result){
        _result = substraction_logic(_num1, _num2);
        emit Substraction(_num1, _num2, _result);
    }

    function divide(int256 _num1, int256 _num2) public pure checkNotZero(_num2) returns (int256 _result){
        _result = _num1 / _num2;
    }

    function multiply(uint256 _num1, uint256 _num2) public{
        result = _num1 * _num2;
    }

    function power(uint256 _num1) public checkMaxPowerNumber(_num1){
        result = result ** _num1;
    }
    
    function substraction_logic(int256 _num1, int256 _num2) pure  internal returns (int256 _result){
        return _num1 - _num2;
    }
}