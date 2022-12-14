// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.17;

// Interfaces
import "src/interfaces/IFlashBorrower.sol";
import "solmate/tokens/ERC20.sol";

// Libraries
import "solmate/utils/SafeTransferLib.sol";

/// @title Simple Flash Lender
/// @author YOUR NAME HERE
/// @notice Simple flash lender contract that allows liquidity providers to deposit and withdraw funds.
contract FlashLender {
    using SafeTransferLib for ERC20;

    /*///////////////////////////////////////////////////////////////
                                CONSTANTS
    //////////////////////////////////////////////////////////////*/

    /// @notice The address of the ERC20 contract.
    ERC20 public immutable TOKEN;

    /*///////////////////////////////////////////////////////////////
                               CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/

    /// @notice Set up the flash lender contract.
    /// The uint256 parameter is only there to ensure that compilation is succesful for the test contracts.
    constructor(ERC20 _TOKEN, uint256) {
        // Set our token to the correct ERC20 address.
        TOKEN = _TOKEN;
    } 

    /*///////////////////////////////////////////////////////////////
                            LENDING INTERFACE
    //////////////////////////////////////////////////////////////*/

    /// @notice Borrow funds from the flash lender contract.
    function borrow(uint256 amount, IFlashBorrower borrower) external {

    }
}