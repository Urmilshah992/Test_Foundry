// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {errorR} from "../src/error.sol";

contract testError is Test {
    errorR public Error;

    function setUp() public {
        Error = new errorR();
    }

    function testFail_throwError() public view {
        Error.throwError();
    }

    function testexpectRevert_throwError() public {
        vm.expectRevert("Not Aurthorised");
        Error.throwError();
    }
}
