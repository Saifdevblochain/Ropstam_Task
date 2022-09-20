 This is a  TEST TASK for the BLOCKCHAIN DEVELOPER POSITION.
##### [Click to see verified Ropstam Token Contract on Rinkeby Testnet](https://rinkeby.etherscan.io/address/0x24eC24453E4d0A774122b8403370D46A0bE26546#code)

##### [Click to see verified NFT Contract on Rinkeby Testnet](https://rinkeby.etherscan.io/address/0xac9216b2e81b4b5d1aaf999d6ff63673571e90f2#code)
Repository consists of two main contracts 
> First is created a simple standard deflationary erc20 smart token named Ropstam,The user can buy the Ropstam token at a price of 100 wei.
> Second is created a contract which contains two tokens, fungible token with name Hammer and non-fungible with name OpenApes.
> The user who owns hammer token cannot own OpenApes and vice versa. 
> The price of the is 100 ropstam tokens.


# Ropstam Token Contract Setup

Open  [Remix](https://remix.ethereum.org).

Go to [Ropstam Task Github Repository](https://github.com/Saifdevblochain/Task-RopstamSolutions) & Paste the code from RopstamToken.sol, ERC20Mod.sol into a new file in Remix. 

#### [ERC20Mod.sol](https://github.com/Saifdevblochain/Ropstam_task/blob/main/ERC20Mod.sol)
This file is modified ERC20 openzeppelin contract. which contains 10% percent token burn on each transfer. 
####  [RopstamToken.sol](https://github.com/Saifdevblochain/Ropstam_task/blob/main/RopstamToken.sol)
In this file we imported ERC20Mod.sol,andit contains ERC20 token having name and symbol Ropstam. 
Users can buy Ropstam Token with minimum Eth value is 100 wei
### Deployment to Testnet:

Select Injected Provider-Metamask (Choose any Testnet)

Hit Compile

Hit Deploy for RopstamToken.sol.

Save contract Address of RopstamToken, we will use it in next contract. 


# NFT Token Contract Setup

Go to [NftContract](https://github.com/Saifdevblochain/Ropstam_task/blob/main/NftContract.sol) & Paste the code from NftContract.sol into a new file in Remix. 

Contract sets owner address and Ropstam token address on deployemnt. 

There is a setOwner() funciton , in which ownership is transferred to new owner. function can be called by only current owner.
Three another functions which include
#### mintHammer() 
Function caller should not own any OpenApes Nft.
#### mintOpenApes() 
Function caller should not own any hammer token
#### withdraw() 
Ropstam tokens will be transferred from contract to owner.

### Deployment to Testnet
Select Injected Provider-Metamask (Choose any Testnet)

Hit Compile

Give tokenURI & Ropstam address that was saved above in constructor arguments. Hit Deploy for NftContract.sol.

Now you can mint hammer tokens and OpenApes NFTs.
