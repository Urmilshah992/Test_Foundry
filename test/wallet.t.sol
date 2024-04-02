// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import {wallet} from "../src/wallet.sol";

import {Test, console} from "forge-std/Test.sol";

contract testWallet is Test {
    wallet public Wallet;

    function setUp() public {
        Wallet = new wallet();
    }

    function testSetNewowner() public {
        // vm.prank(address(2));
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
}
