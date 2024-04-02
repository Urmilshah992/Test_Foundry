// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

contract wallet {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    modifier ownerF() {
        require(payable(msg.sender) == owner, "Not Owner");
        _;
    }

    function withdraw(uint256 _amount) external ownerF {
        payable(msg.sender).transfer(_amount);
    }

    function setOwner(address _Owner) external ownerF {
        owner = payable(_Owner);
    }
}
