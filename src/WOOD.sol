pragma solidity >=0.4.23;

import "ds-token/token.sol";

contract WOOD is DSToken("WOOD") {

    constructor() public {
        setName("Evolution Land Wood");
    }
}
