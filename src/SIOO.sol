pragma solidity ^0.4.23;

import "ds-token/token.sol";

contract SIOO is DSToken("SIOO"), ERC223 {
    constructor() public {
        setName("Evolution Land Silicon");
    }
}
