//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/security/Pausable.sol';
import "hardhat/console.sol";

/**
 * @title PROFI ERC20 token
 */
contract Coin is ERC20, Ownable, Pausable {
    // ==========Constructor========================================
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {}

    // ==========Modifiers==========================================

    // ==========Functions==========================================
    /// @notice mint function
    /// @dev only by owner & vault address
    /// @param to receiver address
    /// @param amount mint amount
    function mint(address to, uint256 amount) external onlyOwner whenNotPaused returns (bool) {
        _mint(to, amount);

        return true;
    }

    // -------------------------------------------------------------
    /// @notice burn function
    /// @param from token owner address
    /// @param amount mint amount
    function burn(address from, uint256 amount) external whenNotPaused returns (bool) {
        _burn(from, amount);

        return true;
    }
}