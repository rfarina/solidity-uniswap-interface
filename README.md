# Solidity Uniswap Interfaces


## **February 2022**


# OVERVIEW

Solidity interfaces provide a means for one Smart Contract to invoke methods on another Smart Contract. In this case, the UniswapExample Smart contract will invoke functions on two Uniswap interfaces in order to get the current reserves of dai and weth that reside on the Ethereum Mainnet Blockchain. The interfaces are UniswapV2Factory and UniswapV2Pair.

To implement the interfaces we must first obtain the contract address of the Uniswap factory; and the contract addresses of both the dai and weth tokens. They can be obtained directly at the following urls:

Factory: `https://docs.uniswap.org/protocol/V2/guides/smart-contract-integration/getting-pair-addresses#examples`

dai: `https://docs.uniswap.org/protocol/V2/guides/smart-contract-integration/getting-pair-addresses#examples`

weth: `https://docs.uniswap.org/protocol/reference/deployments`

This will enable us to test the invocation of the Uniswap interfaces without first deploying the UniswapExample contract. 


## Goals



1. Implement interfaces on the Ethereum Blockchain directly without deploying a single contract. This allows for the testing of interfaces without incurring gas fees.
2. Provide a working example of how to implement interfaces in Solidity.


## Implementation

To avoid paying gas fees for the deployment of the UniswapExample contract, the interfaces will be invoked directly from the compiled code without first deploying to Mainnet. As this is a view only process, there is no exchange of ether to execute the invocations.

This will be accomplished using the Ethereum Remix browser-based IDE at [https://remix.ethereum.org/](https://remix.ethereum.org/). Simply copy the contents of UniswapExample.sol into a file of the same name within the “contracts” folder found on Remix. Once there, the following steps will result in obtaining the current reserves of both tokens.



1. Compile the UniswapExample contract.
2. Select Injected Web3 from the ENVIRONMENT dropdown. This will prompt you to connect to Metamask on Mainnet, which must be done to access the Ethereum Mainnet Blockchain.
3. Go to the Deploy page, but DO NOT DEPLOY.
4. On the CONTRACT dropdown, select UniswapV2Factory. On the “At Address” prompt, provide the “factory” address, then click “At Address”. This will return an instance of UniswapV2Factory, which will be displayed below and provide the getPair() function.
5. On the “getPair” prompt, provide the dai and weth contract addresses as parameters separated by a comma, then click “getPair”. This returns the Pair address that will be used to retrieve the instance of UniswapV2Pair.
6. On the CONTRACT dropdown, select UniswapV2Pair. On the “At Address” prompt, provide the “pair” address, then click “At Address”. This will return an instance of UniswapV2Pair, which will be displayed below and provide the getReserves() function.
7. Click on getReserves. This will return the reserves of each token. The blockTimestampLast is also returned, but for this example it is ignored.


## Conclusion

This process shows how an interface can be used to allow one Smart Contract to invoke functions on another Smart Contract; and doing so entirely through the interface without deploying to the Blockchain. This is an effective way to test the UniswapExample contract without incurring gas fees for each deployment. Once fully tested and audited, the UniswapExample contract could then be deployed to the Ethereum Mainnet Blockchain. The UniswapExample.getTokenReserves() external function could then be invoked directly as needed.


## Dependencies

Remix**: **[https://remix.ethereum.org/](https://remix.ethereum.org/).

Metamask: [https://metamask.io/](https://metamask.io/)


## Attributions

[https://www.youtube.com/watch?v=YWtT0MNHYhQ](https://www.youtube.com/watch?v=YWtT0MNHYhQ) (starting at minute 4:28)

**_End of Document_**
