pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";

contract Sample {
  address public owner;
  mapping (address => uint256) balances;

  constructor() public {
    owner = tx.origin;
    balances[owner] = 1000000;
  }

  modifier onlyOwner() {
    require(tx.origin == owner);
    _;
  }

  function giveBalance(address _to, uint256 _amount) public onlyOwner returns(bool) {
    require(balances[owner] >= _amount);

    balances[owner] = SafeMath.sub(balances[owner], _amount);
    balances[_to] = SafeMath.add(balances[_to], _amount);

    return true;
  }

  function getBalance(address _target) public view returns(uint256) {
    return balances[_target];
  }

  function getOwner() public view returns(address) {
    return owner;
  }
}
