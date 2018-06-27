pragma solidity ^0.4.23;

pragma solidity ^0.4.23;

import './RING.sol';
import './StringHelper.sol';

contract Claim {

    using StringHelper for *;

    // this contract's superuser
    address public supervisor;

    // address of RING.sol on ethereum
    address public ring;

    mapping (address => uint) public userToNonce;


    constructor(address _supervisor) public {
        supervisor  = _supervisor;
    }

    modifier onlySupervisor() {
        require(supervisor == msg.sender);
        _;
    }

    event ClaimedRING(address indexed _user, uint indexed _nonce);

    // _hashmessage = hash("${_user}${_nonce}${_value}")
    // _v, _r, _s are from supervisor's signature on _hashmessage
    // claimRing(...) is invoked by the user who want to claim rings
    // while the _hashmessage is signed by supervisor
    function claimRing(uint _nonce, uint _value, bytes32 _hashmessage, uint8 _v, bytes32 _r, bytes32 _s) public {

        // verify the _hashmessage is signed by supervisor
        require(supervisor == verify(_hashmessage, _v, _r, _s));

        address _user = msg.sender;
        string userStr = _user.addrToString();
        string nonceStr = _nonce.uint2str();
        string valueStr = _value.uint2str();

        // verify that the _user, _nonce, _value are exactly what they should be
        require(keccak256(userStr,nonceStr,valueStr) == _hashmessage);

        // transfer ring from address(this) to _user
        RING ringtoken = RING(ring);
        ringtoken.transfer(_user, _value);

        // after the claiming operation succeeds
        userToNonce[_user]  += 1;
        emit ClaimedRING(_user, _nonce);
    }


    function verify(bytes32 _hashmessage, uint8 _v, bytes32 _r, bytes32 _s) internal pure returns (address) {
        bytes memory prefix = "\x19EvolutionLand Signed Message:\n32";
        bytes32 prefixedHash = keccak256(prefix, _hashmessage);
        address signer = ecrecover(prefixedHash, _v, _r, _s);
        return signer;
    }

    function setSupervisor(address _supervisor) onlySupervisor public {
        supervisor = _supervisor;
    }

    function setRING(address _token) onlySupervisor public {
        ring = _token;
    }
}