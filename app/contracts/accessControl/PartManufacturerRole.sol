pragma solidity ^0.4.24;

import "./Roles.sol";

contract PartManufacturerRole {
    using Roles for Roles.Role;

    event PartManufacturerAdded(address indexed account);
    event PartManufacturerRemoved(address indexed account);

    Roles.Role private partManufacturers;

    constructor() public {
        _addPartManufacturer(msg.sender);
    }

    modifier onlyPartManufacturer() {
        require(isPartManufacturer(msg.sender));
        _;
    }

    function isPartManufacturer(address account) public view returns (bool) {
        return partManufacturers.has(account);
    }

    function addPartManufacturer(address account) public {
        _addPartManufacturer(account);
    }

    function renouncePartManufacturer() public {
        _removePartManufacturer(msg.sender);
    }

    function _addPartManufacturer(address account) internal {
        partManufacturers.add(account);
        emit PartManufacturerAdded(account);
    }

    function _removePartManufacturer(address account) internal {
        partManufacturers.remove(account);
        emit PartManufacturerRemoved(account);
    }
}