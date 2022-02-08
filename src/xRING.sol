pragma solidity >=0.4.23;

import "ds-token/token.sol";

contract xRING is DSToken("xRING") {

    constructor() public {
        setName("Darwinia Network Test Token[Darwinia>");
        decimals = 9;
    }
}
