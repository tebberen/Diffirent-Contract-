// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title BaseModule
/// @notice Tüm modüllerin temel şablonu.
abstract contract BaseModule {
    address public hub;

    modifier onlyHub() {
        require(msg.sender == hub, "ONLY_HUB");
        _;
    }

    constructor(address hub_) {
        hub = hub_;
    }
}
