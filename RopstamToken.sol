// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;
import "./ERC20Mod.sol";

contract Ropstam is ERC20Mod {
    uint256 price = 0.0000000000000001 ether;
    address payable owner;

    constructor() ERC20Mod("Ropstam", "Ropstam") {
        _mint(msg.sender, 10**8 * 10**18);
        owner = payable(msg.sender);
    }

    function buyTokens(uint256 _price) external payable {
         // buyer must sent price greater than 10 wei
        require(
            msg.value == _price,
            "Sent amount and input amount doesnot match"
        );
        require(msg.value >= price, "You must pay greater than 100 wei");
        owner.transfer(msg.value);
        _transfer(owner, msg.sender, ((_price * 1) / 100) * 10**18);
    }
}
