pragma solidity ^0.4.23;

import "ds-token/token.sol";

contract GOLD is DSToken("GOLD") {
    constructor() public {
        setName("Evolution Land Gold");
    }
}
