// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.17;

import "src/FlashLender.sol";
import "src/interfaces/IFlashBorrower.sol";
import "src/interfaces/IFlashLender.sol";

import "solmate/test/utils/mocks/MockERC20.sol";
import "solmate/tokens/ERC20.sol";

import {DSTestPlus} from "solmate/test/utils/DSTestPlus.sol";


contract SimpleTests is DSTestPlus {
    ISimpleFlashLender lender;
    MockERC20 token;

    function setUp() public {
        token = new MockERC20("Test Token", "TEST", 18);
        lender = ISimpleFlashLender(address(new FlashLender(ERC20(address(token)), 0)));

        token.mint(address(lender), 1000 ether);
    }

    function testLoan() public {
        GoodBorrower borrower = new GoodBorrower();
        lender.borrow(1000 ether, IFlashBorrower(address(borrower)));
    }

    function testLoanSuccess() public {
        GoodBorrower borrower = new GoodBorrower();
        lender.borrow(1000 ether, IFlashBorrower(address(borrower)));
    }

    function testFailRevertsIfNotReturned() public {
        BadBorrower borrower = new BadBorrower();
        lender.borrow(1000 ether, IFlashBorrower(address(borrower)));
    }

    function testFailRevertsIfSemiReturned() public {
        MistakenBorrower borrower = new MistakenBorrower();
        lender.borrow(1000 ether, IFlashBorrower(address(borrower)));
    }

}

contract GoodBorrower {
    function executeOnFlashLoan(ERC20 token, uint256 amount, uint256) external {
        token.transfer(msg.sender, amount);
    }
}

contract BadBorrower {
    function executeOnFlashLoan(ERC20 token, uint256, uint256) external {
        token.transfer(msg.sender, 0);
    }
}

contract MistakenBorrower {
    function executeOnFlashLoan(ERC20 token, uint256 amount, uint256) external {
        token.transfer(msg.sender, amount/2);
    }
}
