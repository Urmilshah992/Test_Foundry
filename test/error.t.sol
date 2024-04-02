// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {errorR} from "../src/error.sol";

contract testError is Test {
    errorR public Error;

    function setUp() public {
        Error = new errorR();
    }
}
