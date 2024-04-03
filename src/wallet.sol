// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

contract wallet {
    address payable public owner;
    event Deposit(address account, uint256 amount);

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

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
