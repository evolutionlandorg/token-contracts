pragma solidity >=0.4.23;

import "ds-token/token.sol";

contract RING is DSToken("RING") {

    constructor() public {
        setName("Darwinia Network Native Token");
    }
}
