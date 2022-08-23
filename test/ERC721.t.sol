// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/ERC721.sol";
import "forge-std/console.sol";

contract ERC721Test is Test, ERC721 {
    MyNFT erc721;
    address bob = address(0x1);
    address mary = address(0x2);

    function setUp() public {
        erc721 = new MyNFT();
    }
    function testMintToken() public {
        erc721.mint(bob, 0);

        address owner_of = erc721.ownerOf(0);
        assertEq(bob, owner_of);
    }

    function testTransferToken() public {
        erc721.mint(bob, 0);

        vm.startPrank(bob);
        erc721.safeTransferFrom(bob, mary, 0);

        address owner_of = erc721.ownerOf(0);
        assertEq(mary, owner_of);
    }

    function testGetBalance() public {
        erc721.mint(bob, 0);
        erc721.mint(bob, 1);
        erc721.mint(bob, 2);
        erc721.mint(bob, 3);
        erc721.mint(bob, 4);

        uint256 b = erc721.balanceOf(bob);
        // console.log("balance of Bob: %s", b);
        assertEq(4, b, "wrong input");
    }

    function testBurn() public {
        erc721.mint(bob, 0);

        vm.startPrank(bob);
        erc721.burn(0);
        vm.stopPrank();
    }
    function testOnlyOwnerBurn() public {
        erc721.mint(bob, 0);

        vm.startPrank(mary);
        vm.expectRevert("not owner");
        erc721.burn(0);
        vm.stopPrank();

        emit log_address(mary);
    }
    
}
