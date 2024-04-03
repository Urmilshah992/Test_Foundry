// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import {wallet} from "../src/wallet.sol";

import {Test, console} from "forge-std/Test.sol";

contract testWallet is Test {
    wallet public Wallet;

    function setUp() public {
        Wallet = new wallet{value: 1e18}();
    }

    function _send(uint256 amount) private {
        (bool success, ) = address(Wallet).call{value: amount}("");
        require(success, "send Eth Failed");
    }

    function testSetNewowner() public {
        // vm.prank(address(2))-- Fake Address;
        Wallet.setOwner(address(2));
        assertEq(Wallet.owner(), address(2));
    }

    function testFail_Setowner() public {
        Wallet.setOwner(address(1));
        vm.startPrank(address(1));
        Wallet.setOwner(address(1));
        vm.stopPrank();
        Wallet.setOwner(address(1));
    }

    function testEthbalance() public view {
        console.log("Total Eth", address(this).balance / 1e18);
    }

    function testsednEth() public {
        //deal(address,uint) -- Set balance of address
        uint256 b = address(Wallet).balance;
        // console.log(address(1).balance);
        deal(address(1), 100);
        // console.log(address(1).balance);
        assertEq(address(1).balance, 100);
        console.log(b);

        //hoax(address,uint) -- deal + prank -- Set up a prank and set balance

        deal(address(1), 10);
        vm.prank(address(1));
        _send(5);
        // console.log(b);

        hoax(address(1), 456);
        _send(456);
        console.log(b);

        assertEq(address(Wallet).balance, b + 456);
    }
}
