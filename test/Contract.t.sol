// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Counter.sol";

contract ContractTest is Test {
    Counter counter;
    function setUp() public {
        counter = new Counter(10);
    }

    function testGetCount() public {
        uint256 c = counter.count();
        assertEq(c, 10);
        emit log_named_uint("The value is: ", c);
    }

    function testIncrement() public {
        counter.increment();
        uint256 c = counter.count();
        assertEq(c, 11);
        emit log_named_uint("The value is: ", c);
    }

    function testDecrement() public {
        counter.decrement();
        uint256 c = counter.count();
        assertEq(c, 9);
        emit log_named_uint("The value is: ", c);
    }
}
