// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {time} from "../src/Time.sol";

contract testTime is Test {
    /** vm.warp = set the block timestamp to future timestamp
     * vm.roll =set block number
     * rewin= decrement the timestamp
     * skip = Increament the timestamp
     */
    time public Time;
    uint256 private startAt;

    function setUp() public {
        Time = new time();
        startAt = block.timestamp;
    }

    function testBidFail_BeforestartTime() public {
        vm.expectRevert(bytes("Cannot bid"));
        Time.bid();
    }

    function testBid() public {
        vm.warp(startAt + 1 days);
        Time.bid();
    }

    function testTimpestamp() public {
        uint t = block.timestamp;
        skip(100);
        assertEq(block.timestamp, t + 100);
        rewind(10);
        assertEq(block.timestamp, t + 100 - 10);
    }

    function testBlocknumber() public {
        uint b = block.number;
        console.log("current Block Number is ", b);
        vm.roll(1000);
        assertEq(block.number, 1000);
    }
}
