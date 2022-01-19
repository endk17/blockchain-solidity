// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

import "./simplestorage.sol";

contract StorageFactory is SimpleStorage {
    
    SimpleStorage[] public simpleStorageArray;
    
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        /*
         - Need an address & ABI

        # below is an longer method to utilsie the 
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        simpleStorage.store(_simpleStorageNumber);

        */
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageNumber) public view returns (uint256) {
        /*
        # below is an longer method to utilsie the retrieve call
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageNumber]));
        return simpleStorage.retrieve();
        */
        return SimpleStorage(address(simpleStorageArray[_simpleStorageNumber])).retrieve();
    }
}
