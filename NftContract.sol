// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract NFTContract is ERC1155 {

    // initializations
    uint256 public constant hammer = 0;
    uint256 public Open_Apes = 1;
    IERC20 public Ropstam;
    uint256 public ropstamPrice = 100 * 10**18;
    address owner;

    // Mappings
    mapping(address => bool) public hammerAddresses;
    mapping(address => bool) public openApesAddresses;

    constructor(IERC20 _RopstamToken, string memory _uri) ERC1155(_uri) {
        Ropstam = _RopstamToken;
        owner = msg.sender;
    }
    // Modifier
    modifier onlyOwner() {
        require(owner == msg.sender, "No sufficient right");
        _;
    }
    // sets new owner
    function setOwner(address _newOwner) external onlyOwner {
        owner = _newOwner;
    }

    // Minting Functions
    function mintHammer(uint256 _amount) public {
         // it will revert if msg.sender owns Open Apes token
        require(
            openApesAddresses[msg.sender] == false,
            "You cannot own Hammer"
        );
        hammerAddresses[msg.sender] = true;
        _mint(msg.sender, hammer, _amount, "");
    }

    function mintOpenApes() public {
        // it will revert if msg.sender owns hammer token
        require(
            hammerAddresses[msg.sender] == false,
            "You cannot own Open Apes"
        );
        require(Ropstam.balanceOf(msg.sender) >= ropstamPrice, "Low balance ");
        Ropstam.transferFrom(msg.sender, address(this), ropstamPrice);
        openApesAddresses[msg.sender] = true;
        _mint(msg.sender, Open_Apes, 1, "");
        Open_Apes++;
    }

    function withdraw() public onlyOwner {
        // Transfers Ropstam balance from contrac to owner
        uint256 contractBalance = Ropstam.balanceOf(address(this));
        Ropstam.transfer(owner, contractBalance);
    }
}
