### Key points of each ethernaut levels
1. Fallback - how to call receive and fallback functions 
2. Fallout - noticing silly mistakes in contracts
3. Coin flip - Randomness cannot be generated from the blockchain
4. Telephone - difference between tx.origin and msg.sender - don't rely on tx.origin as it can be manipulated
5. Token - Underflow and Overflow in the older version of solidity
6. Delegation - How delegate call works and how to call a function using call data by obtaining the function selector
7. Force - How to send ether to a contract which doesn't have a receive function(using self destruct function in another contract)
8. Vault - How to read the private variables - Anything stored on the contract can be viewed
9. King - How denial of service attack works by using a contract's fallback function - don't trust other contracts, they can have any engineered code
10. Re-entrancy - How to perform a Basic reentrancy attack using fallback function on receiving ether - do proper updates of state variables before transferring funds or use reentrancy lock  