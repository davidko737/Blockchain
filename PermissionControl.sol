// SPDX-License-Identifier: GPL-3.0


pragma solidity >=0.7.0 <0.9.0;

contract PermissionControl {

    // the owner of this contract
    address owner;

    /* enforces that only the owner of this contract can run any function it is attached to */
    modifier onlyOwner() {
        if (owner == msg.sender) {
            _;
        }
    }

    /* Called only when this contract is created via a contract creation transaction */
    constructor ()  {
        owner = msg.sender;
    }
    
    /* Only the current owner can set a new owner */
    function setOwner(address _owner) public onlyOwner() {
        owner = _owner;
    }

}
