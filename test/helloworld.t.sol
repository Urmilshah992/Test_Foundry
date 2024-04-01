// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {helloworld} from "../src/helloworld.sol";

contract testHelloWorld is Test {
    helloworld public Helloworld;

    function setUp() public {
        Helloworld = new helloworld();
    }

    function testhello() public view {
        // string memory _test = "Hello World";
        assertEq(Helloworld.Greet(), "Hello World");
    }
}
