// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {MainHub} from "../contracts/MainHub.sol";

contract MainHubTest is Test {
    function testOwnerIsDeployer() public {
        MainHub hub = new MainHub();
        assertEq(hub.owner(), address(this));
    }
}
