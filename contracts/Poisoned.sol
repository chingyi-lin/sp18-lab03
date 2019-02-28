pragma solidity 0.5.0;

import "./AuctionInterface.sol";

/** @title Poisoned */
contract Poisoned {

	address payable target;

	/* Constructor */
	constructor() public payable {}

	/* Bid function */
	function bid(uint amount) external {
		if ((amount <= address(this).balance) && (target != address(0))) {
			AuctionInterface _target = AuctionInterface(target);
			_target.bid.value(amount)();
		}
	}

	function reduceBid() external {
		if (target != address(0)) {
			AuctionInterface _target = AuctionInterface(target);
			_target.reduceBid();
		}
	}

	function setTarget(address payable auction) external {
		if (auction != address(this)) {
			target = auction;
		}
	}

	function getTarget() public view returns (address) {
		return target;
	}

	function getBalance() public view returns (uint) {
		return address(this).balance;
	}

	function() external {}
}
