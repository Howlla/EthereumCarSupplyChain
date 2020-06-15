pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'CarManufacturerRole' to manage this role - add, remove, check
contract CarManufacturerRole {
    using Roles for Roles.Role;

    // Define 2 events, one for Adding, and other for Removing
    event CarManufacturerAdded(address indexed account);
    event CarManufacturerRemoved(address indexed account);

    // Define a struct 'carManufacturers' by inheriting from 'Roles' library, struct Role
    Roles.Role private carManufacturers;

    // In the constructor make the address that deploys this contract the 1st carManufacturer
    constructor() public {
        _addCarManufacturer(msg.sender);
    }

    // Define a modifier that checks to see if msg.sender has the appropriate role
    modifier onlyCarManufacturer() {
        require(isCarManufacturer(msg.sender));
        _;
    }

    // Define a function 'isCarManufacturer' to check this role
    function isCarManufacturer(address account) public view returns (bool) {
        return carManufacturers.has(account);
    }

    // Define a function 'addCarManufacturer' that adds this role
    function addCarManufacturer(address account) public {
        _addCarManufacturer(account);
    }

    // Define a function 'renounceCarManufacturer' to renounce this role
    function renounceCarManufacturer() public {
        _removeCarManufacturer(msg.sender);
    }

    // Define an internal function '_addCarManufacturer' to add this role, called by 'addCarManufacturer'
    function _addCarManufacturer(address account) internal {
        carManufacturers.add(account);
        emit CarManufacturerAdded(account);
    }

    // Define an internal function '_removeCarManufacturer' to remove this role, called by 'removeCarManufacturer'
    function _removeCarManufacturer(address account) internal {
        carManufacturers.remove(account);
        emit CarManufacturerRemoved(account);
    }
}