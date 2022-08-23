// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public count;

    constructor(uint256 _count) {
        count = _count;
    }

    function increment() external {
        ++count;
    }

    function decrement() external {
        --count;
    }
}
