// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CashToken is ERC20 {
    constructor() ERC20("Anonymous Zether", "ZTH") {}

    function mint(address account, uint256 amount) external {
        // just for testing
        _mint(account, amount);
    }
}
