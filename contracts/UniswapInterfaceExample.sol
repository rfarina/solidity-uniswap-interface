// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6.0;

/* 
@notice This contract is not meant to be deployed to Mainnet. 

It is best run as an example from with Remix by directly invoking the interface functions
without deploying to Mainnet, thus avoiding gas fees.

Remix will allow you to:
    - compile this contract (do not deploy)
    - connect to Injected Web3, which will connect to Mainnet via Metamask
    - get reference to UniswapV2Factory by using "At Address", while providing the factory 
      address below
    - run getPair, passing in dai and weth addresses as parameters. The address (pair) 
      that maintains the pair of tokens is returned
    - use "At Address", providing pair address, which will return UniswapV2Pair instance
    - invoke getReserves on the instance, which will return the reserves of dai and weth
    
    - All this will be accomplished by invoking functions directly on the UniswapV2Factory 
      and UniswapV2Pair Interfaces.

@dev No contracts were injured in any way during this experiment  

 */


interface UniswapV2Factory {
    function getPair(address tokenA, address tokenb) external view returns (address pair);
}

interface UniswapV2Pair {
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}


contract UniswapInterfaceExample {

    // These address are provided by Uniswap at the indicated urls
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    // https://docs.uniswap.org/protocol/V2/guides/smart-contract-integration/getting-pair-addresses#examples
    
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    // https://etherscan.io/token/0x6b175474e89094c44da98b954eedeac495271d0f

    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    // https://docs.uniswap.org/protocol/reference/deployments

    function getTokenReserves() external view returns (uint, uint) {
        address pair = UniswapV2Factory(factory).getPair(dai, weth);
        (uint112 reserve0, uint112 reserve1,) = UniswapV2Pair(pair).getReserves();
        return(reserve0, reserve1);
    }
}