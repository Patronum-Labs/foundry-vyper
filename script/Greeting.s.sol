// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";

///@notice This cheat codes interface is named _CheatCodes so you can use the CheatCodes interface in other testing files without errors
// solhint-disable-next-line contract-name-camelcase
interface _CheatCodes {
    function ffi(string[] calldata) external returns (bytes memory);
}

contract GreetingScript is Script {
    address public constant HEVM_ADDRESS =
        address(bytes20(uint160(uint256(keccak256("hevm cheat code")))));

    /// @notice Initializes cheat codes in order to use ffi to compile Vyper contracts
    _CheatCodes public cheatCodes = _CheatCodes(HEVM_ADDRESS);

    string public constant INITIAL_GREETING = "yoSnakes";
    function run() external {
        ///@notice create a list of strings with the commands necessary to compile Vyper contracts
        string[] memory cmds = new string[](2);
        cmds[0] = "vyper";
        cmds[1] = string.concat("src/", "Greeting", ".vy");

        ///@notice compile the Vyper contract and return the bytecode
        bytes memory _bytecode = cheatCodes.ffi(cmds);

        //add args to the deployment bytecode
        bytes memory args = abi.encode(INITIAL_GREETING);
        bytes memory bytecode = abi.encodePacked(_bytecode, args);

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        ///@notice deploy the bytecode with the create instruction
        address deployedAddress;
        // solhint-disable-next-line no-inline-assembly
        assembly {
            deployedAddress := create(0, add(bytecode, 0x20), mload(bytecode))
        }

        ///@notice check that the deployment was successful
        // solhint-disable-next-line gas-custom-errors
        require(deployedAddress != address(0), "Could not deploy contract");

        vm.stopBroadcast();
    }
}
