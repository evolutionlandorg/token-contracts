pragma solidity ^0.4.24;

import "ds-test/test.sol";

import "./TokenContracts.sol";

contract TokenContractsTest is DSTest {
    TokenContracts contracts;

    function setUp() public {
        contracts = new TokenContracts();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
