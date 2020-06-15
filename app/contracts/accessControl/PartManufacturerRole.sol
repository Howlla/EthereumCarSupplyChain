pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'PartManufacturerRole' to manage this role - add, remove, check
contract PartManufacturerRole {
    using Roles for Roles.Role;

    // Define 2 events, one for Adding, and other for Removing
    event PartManufacturerAdded(address indexed account);
    event PartManufacturerRemoved(address indexed account);

    // Define a struct 'partManufacturers' by inheriting from 'Roles' library, struct Role
    Roles.Role private partManufacturers;

    // In the constructor make the address that deploys this contract the 1st partManufacturer
    constructor() public {
        _addPartManufacturer(msg.sender);
    }

    // Define a modifier that checks to see if msg.sender has the appropriate role
    modifier onlyPartManufacturer() {
        require(isPartManufacturer(msg.sender));
        _;
    }

    // Define a function 'isPartManufacturer' to check this role
    function isPartManufacturer(address account) public view returns (bool) {
        return partManufacturers.has(account);
    }

    // Define a function 'addPartManufacturer' that adds this role
    function addPartManufacturer(address account) public {
        _addPartManufacturer(account);
    }

    // Define a function 'renouncePartManufacturer' to renounce this role
    function renouncePartManufacturer() public {
        _removePartManufacturer(msg.sender);
    }

    // Define an internal function '_addPartManufacturer' to add this role, called by 'addPartManufacturer'
    function _addPartManufacturer(address account) internal {
        partManufacturers.add(account);
        emit PartManufacturerAdded(account);
    }

    // Define an internal function '_removePartManufacturer' to remove this role, called by 'removePartManufacturer'
    function _removePartManufacturer(address account) internal {
        partManufacturers.remove(account);
        emit PartManufacturerRemoved(account);
    }
}