pragma solidity ^0.4.23;

/*
    Smart Token interface
*/
contract ISmartToken {
    function transferOwnership(address _newOwner) public;
    function acceptOwnership() public;

    function disableTransfers(bool _disable) public;
    function issue(address _to, uint256 _amount) public;
    function destroy(address _from, uint256 _amount) public;
}