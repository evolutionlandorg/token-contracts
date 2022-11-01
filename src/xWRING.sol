pragma solidity >=0.4.23;

import "ds-token/token.sol";

contract xWRING is DSToken("xWRING") {

    constructor() public {
        setName("Wrapped Ring[Darwinia Smart>(Test)");
        decimals = 18;
    }
}
