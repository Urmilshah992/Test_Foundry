// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";

contract testSignature is Test {
    function testSignature_() public pure {
        uint256 praivateKey = 123;
        address publicKey = vm.addr(praivateKey);
        bytes32 messageHash = keccak256("Hello World");
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(praivateKey, messageHash);
        address signer = ecrecover(messageHash, v, r, s);

        assertEq(signer, publicKey);

        bytes32 invalaidMessageHash = keccak256("Hello");
        signer = ecrecover(invalaidMessageHash, v, r, s);
        assertFalse(signer == publicKey);
    }
}
