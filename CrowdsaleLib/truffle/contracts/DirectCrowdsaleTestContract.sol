pragma solidity ^0.4.13;

import "./DirectCrowdsaleLib.sol";
import "./CrowdsaleToken.sol";

contract DirectCrowdsaleTestContract {
  using DirectCrowdsaleLib for DirectCrowdsaleLib.DirectCrowdsaleStorage;

  DirectCrowdsaleLib.DirectCrowdsaleStorage sale;

  function DirectCrowdsaleTestContract(
                address owner,
                uint256 tokenPrice,
                uint256 capAmount,
                uint256 minimumTargetRaise,
                uint256 auctionSupply,
                uint256 startTime,
                uint256 endTime,
                uint256 periodicChange,
                uint256 timeInterval,
                bool increase,
                CrowdsaleToken token)
  {
  	sale.init(owner, tokenPrice, capAmount, minimumTargetRaise, auctionSupply, startTime, endTime, periodicChange, timeInterval, increase, token);
  }

  // fallback function can be used to buy tokens
  function () payable {
    receivePurchase();
  }

  function receivePurchase() payable returns (bool) {
  	return sale.receivePurchase(msg.value);
  }

  function owner() constant returns (address) {
    return sale.base.owner;
  }

  function tokenPrice() constant returns (uint256) {
    return sale.base.tokenPrice;
  }

  function capAmount() constant returns (uint256) {
    return sale.base.capAmount;
  }

  function minimumTargetRaise() constant returns (uint256) {
    return sale.minimumTargetRaise;
  }

  function auctionSupply() constant returns (uint256) {
    return sale.base.auctionSupply;
  }

  function startTime() constant returns (uint256) {
    return sale.base.startTime;
  }

  function endTime() constant returns (uint256) {
    return sale.base.endTime;
  }

  function periodicChange() constant returns (uint256) {
    return sale.periodicChange;
  }

  function timeInterval() constant returns (uint256) {
    return sale.timeInterval;
  }

  function increase() constant returns (bool) {
    return sale.increase;
  }

  function ownerBalance() constant returns (uint256) {
  	return sale.ownerBalance;
  }

  function ownerWithdrawl() returns (bool) {
  	return sale.ownerWithdrawl();
  }

  function crowdsaleActive() constant returns (bool) {
  	return sale.crowdsaleActive();
  }

  function crowdsaleEnded() constant returns (bool) {
  	return sale.crowdsaleEnded();
  }

  function withdrawTokens() returns (bool) {
  	return sale.withdrawTokens();
  }

  function getContribution(address _buyer) constant returns (uint256) {
  	return sale.getContribution(_buyer);
  }

  function getTokenPurchase(address _buyer) constant returns (uint256) {
  	return sale.getTokenPurchase(_buyer);
  }

}






