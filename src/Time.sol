// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

contract time {
    uint256 public startAt = block.timestamp + 1 days;
    uint256 public endAt = block.timestamp + 2 days;

    function bid() external view {
        require(
            block.timestamp >= startAt && block.timestamp < endAt,
            "Cannot bid"
        );
    }

    function end() external view {
        require(block.timestamp >= endAt, " cannot end");
    }
}
