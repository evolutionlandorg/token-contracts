pragma solidity ^0.4.23;

import "ds-token/token.sol";

contract KTON is DSToken("KTON") {

    constructor() public {
        setName("Darwinia Commitment Token");
    }
}
