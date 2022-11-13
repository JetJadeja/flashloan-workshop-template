// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.17;

// Interfaces
import "src/interfaces/IFlashBorrower.sol";
import "solmate/tokens/ERC20.sol";

/// @title Simle Flash Lender Interface
/// @author Jet Jadeja <jet@pentagon.xyz>
/// @notice Simple Flash lender interface used by tests.
abstract contract ISimpleFlashLender {
    /*///////////////////////////////////////////////////////////////
                                CONSTANTS
    //////////////////////////////////////////////////////////////*/
    function TOKEN() public virtual view returns (ERC20);

    /// @notice Borrow funds from the flash lender contract.
    function borrow(uint256 amount, IFlashBorrower borrower) external virtual;
}

/// @title Intermediate Flash Lender Interface
/// @author Jet Jadeja <jet@pentagon.xyz>
/// @notice Advanced Flash lender interface used by tests.
abstract contract IIntermediateFlashLender {
    /*///////////////////////////////////////////////////////////////
                                CONSTANTS
    //////////////////////////////////////////////////////////////*/

    function TOKEN() public virtual view returns (ERC20);
    function FEE() public virtual view returns (ERC20);
    function OWNER() public virtual view returns (address);

    /*///////////////////////////////////////////////////////////////
                       LIQUIDITY PROVIDER INTERFACE
    //////////////////////////////////////////////////////////////*/

    /// @notice Deposit funds into the flash lender contract.
    /// @param amount The amount of funds to deposit.
    function deposit(uint256 amount) external virtual;

    /// @notice Withdraw funds from the flash lender contract.
    /// @param amount The amount of funds to withdraw.
    /// Will fail if the liquidity provider does not have enough funds.
    function withdraw(uint256 amount) external virtual;

    /// @notice Retrieve the fees that have been collected.
    /// @notice Can only be called by the owner.
    function collectFees() external virtual;

    /*///////////////////////////////////////////////////////////////
                            LENDING INTERFACE
    //////////////////////////////////////////////////////////////*/

    /// @notice Boolean indicating whether the contract is currently in a flash loan.
    function inFlashLoan() public virtual view returns (bool);


    /// @notice Borrow funds from the flash lender contract.
    function borrow(uint256 amount, IFlashBorrower borrower) external virtual;
}

/// @title Advanced Flash Lender Interface
/// @author Jet Jadeja <jet@pentagon.xyz>
/// @notice Flash lender interface used by tests.
abstract contract IAdvancedFlashLender is ERC20 {
    /*///////////////////////////////////////////////////////////////
                                CONSTANTS
    //////////////////////////////////////////////////////////////*/

    function TOKEN() public virtual view returns (ERC20);
    function FEE() public virtual view returns (ERC20);

    
    /*///////////////////////////////////////////////////////////////
                          SHARE PRICE INTERFACE
    //////////////////////////////////////////////////////////////*/

    /// @notice Calculate the exchange rate between the share tokens and the underlying tokens.
    /// @return The exchange rate scaled by 1e18.
    function sharePrice() public virtual view returns (uint256);

    /// @notice Calculate the amount of underlying tokens that are held by a user.
    function balanceOfUnderlying(address account) public virtual view returns (uint256);

    /*///////////////////////////////////////////////////////////////
                       LIQUIDITY PROVIDER INTERFACE
    //////////////////////////////////////////////////////////////*/

    /// @notice Deposit funds into the flash lender contract.
    /// @param amount The amount of funds to deposit.
    function deposit(uint256 amount) external virtual;

    /// @notice Withdraw funds from the flash lender contract.
    /// @param amount The amount of funds to withdraw.
    /// Will fail if the liquidity provider does not have enough funds.
    function withdraw(uint256 amount) external virtual;

    /*///////////////////////////////////////////////////////////////
                            LENDING INTERFACE
    //////////////////////////////////////////////////////////////*/

    /// @notice Boolean indicating whether the contract is currently in a flash loan.
    function inFlashLoan() public virtual view returns (bool);

    /// @notice Borrow funds from the flash lender contract.
    function borrow(uint256 amount, IFlashBorrower borrower) external virtual;
}