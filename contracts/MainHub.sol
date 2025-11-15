// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title CeloModuleX MainHub
/// @notice Modüller için kayıt, yetkilendirme ve ücret yönlendirme iskeleti.
/// @dev Bu sade sürüm, daha sonra eklenecek RBAC, ücret ve istatistik
///      mekanizmaları için temel görevleri tutar. Çatışmaları giderirken
///      yeni isimlendirmeyi garanti altına almak adına dosya başlığı da
///      güncellenmiştir.
contract MainHub {
    address public owner;

    event ModuleRegistered(address indexed module, string name);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "NOT_OWNER");
        _;
    }

    function registerModule(address module, string calldata name) external onlyOwner {
        emit ModuleRegistered(module, name);
    }
}
