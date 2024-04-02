// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

contract errorR {
    error NotAurthorised();

    function throwError() external pure {
        require(false, "Not Aurthorised");
    }

    function CustomError() external pure {
        revert NotAurthorised();
    }
}
