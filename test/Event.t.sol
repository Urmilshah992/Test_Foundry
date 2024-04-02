// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {Event} from "../src/Event.sol";

contract TestEvent is Test {
    event Transfer(address indexed from, address indexed to, uint256 amount);

    Event public e;

    function setUp() public {
        e = new Event();
    }

    function testEmitTransferEvent() public {
        /*function expectEmit{
                bool checkTopic1
                bool checkTopic2
                bool checkTopic3
                bool checkData
            } external  */

        //Step by step understanding
        /*1)Tell Foundry which data to check
              2) Emit the expected event
              3)call the function that should emit the event
             */
        /*1*/ vm.expectEmit(true, true, false, true);
        /**2*/ emit Transfer(address(this), address(123), 456);
        /**3*/ e.transfer(address(this), address(123), 456);

        /*1*/ vm.expectEmit(true, false, false, true);
        /**2*/ emit Transfer(address(this), address(123), 456);
        /**3*/ e.transfer(address(this), address(1234), 456);
    }

    function testEmitManyTransferEvent() public {
        address[] memory to = new address[](2);
        to[0] = address(456);
        to[1] = address(123);
        uint256[] memory amouts = new uint256[](2);
        amouts[0] = 786;
        amouts[1] = 888;
        for (uint256 i = 0; i < to.length; i++) {
            vm.expectEmit(true, true, true, false);
            emit Transfer(address(this), to[i], amouts[i]);
        }
        e.transerMany(address(this), to, amouts);
    }
}
