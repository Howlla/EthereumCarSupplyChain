pragma solidity ^0.4.24;

import "./Roles.sol";

contract DealershipRole {
    using Roles for Roles.Role;

    event  DealershipAdded(address indexed account);
    event  DealershipRemoved(address indexed account);

    Roles.Role private dealerships;

    constructor() public {
        _addDealership(msg.sender);
    }

    modifier onlyDealer() {
        require(isDealer(msg.sender));
        _;
    }

    function isDealer(address account) public view returns (bool) {
        return dealerships.has(account);
    }

    function addDealership(address account) public {
        _addDealership(account);
    }

    function renounceDealership() public {
        _removeDealership(msg.sender);
    }

    function _addDealership(address account) internal {
        dealerships.add(account);
        emit DealershipAdded(account);
    }

    function _removeDealership(address account) internal {
        dealerships.remove(account);
        emit DealershipRemoved(account);
    }
}