// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import {MainHub} from "../contracts/MainHub.sol";

/// @notice Deploys MainHub to the target network using Foundry scripts.
contract DeployMainHub is Script {
    function run() external {
        uint256 deployerKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerKey);
        MainHub hub = new MainHub();
        vm.stopBroadcast();

        console2.log("MainHub deployed at", address(hub));
    }
}
