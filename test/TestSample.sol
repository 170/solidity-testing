pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Sample.sol";

contract TestSample {
  function testGiveBalance() public {
    Sample sample = Sample(DeployedAddresses.Sample());

    address target = 0xdCad3a6d3569DF655070DEd06cb7A1b2Ccd1D3AF;
    uint256 amount = 1234;
    sample.giveBalance(target, amount);

    Assert.equal(sample.getBalance(target), amount, "target address get 1234");
    Assert.equal(sample.getBalance(sample.getOwner()), 1000000 - amount, "owner lose 1234");
  }
}
