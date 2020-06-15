// migrating the appropriate contracts
var CarManufacturerRole = artifacts.require("./CarManufacturerRole.sol");
var DealershipRole = artifacts.require("./DealershipRole.sol");
var PartManufacturerRole = artifacts.require("./PartManufacturerRole.sol");
var SupplyChain = artifacts.require("./ProductManagement.sol");

module.exports = function(deployer) {
  deployer.deploy(CarManufacturerRole);
  deployer.deploy(DealershipRole);
  deployer.deploy(PartManufacturerRole);
  deployer.deploy(SupplyChain);
};
