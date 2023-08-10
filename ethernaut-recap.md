1. Fallback - how to call receive and fallback functions 
2. Fallout - noticing silly mistakes in contracts
3. Coin flip - True randomness cannot be generated from the blockchain and any source of randomness can be redone in the code, coding your own contract to exploit other contracts rather than only finding issues in them
4. Telephone - difference between `tx.origin` and `msg.sender` - don't rely on `tx.origin` as it can me manipulated
5. Token - Underflow and Overflow in the older version of solidity
6. Delegation - How delegate call works and how to call a function using call data by obtaining the function selector
7. Force - How to send ether to a contract which doesn't have a receive function(using self destruct function in another contract)
8. Vault - How to read the private variables - Anything stored on the contract can be viewed
9. King - basics of how to perform a denial of service attack - don't assume all of your users to be EOA and don't trust other contracts, they can have any engineered code - Make the users withdraw their money, don't send the money in a function which makes state changes
10. Re-entrancy - How to perform a Basic reentrancy attack using fallback function on receiving ether - The `checks-Effects-Interactions` pattern - do proper updates of state variables before transferring funds or use reentrancy lock
11. Elevator - creating an instance and using users contract will always be a problem as there will be some kind of loophole that we didn't know of, restrictions to writing to state in interface can be brought by view or pure modifiers
12. Privacy - Structure of storage slot in solidity, How to read private array values and typecasting.
13. Gate Keeper One - about the `gasleft()` function, how to use brute forcing, gas usage for different op codes, type casting between uint and bytes and how the values can change during typecasting
14. Gate Keeper Two - What is assembly in solidity and how the code in the constructor is going to behave and the size of the code, how bitwise operator(XOR) works in solidity, how to use the not operator
15. Naught coin - Understanding the ERC20 standard and exploring the different functions available 
16. Preservation - importance of storage slot alignment in proxy contracts using delegate call, casting address to uint
17. Recovery - How to use block explorer to obtain information about a transaction
18. Magic Num - What is bytecode, What are opcodes, what is creation code and runtime code, writing contract using opcodes and compiling it down to bytecode. How conversion of hexadecimal to byte works
19. Alien Codex - How ownable library from openzeppelin stores the owner value. How using underflow we can get access to all the storage slots
20. Denial - 
21. Shop - How to use the state of the caller contract when restricted by view function in an interface - Similar to elevator, with view restriction
22. Dex - How decentralized exchanges work - How price balance must be maintained in dex - How the swap price calculation is very important 
23. Dex two - Dex that can add any token without code review  to the exchange pool runs a risk as that contract can have malicious code
24. Puzzle Wallet - 
25. Motorbike - 
26. Double Entry Point - Understanding DEP tokens and the risk associated with them
27. Good Samaritan - How custom errors work
28. Gate Keeper Three - How to not accept ether from a contract
29. Switch - Structure of calldata for static and dynamic types - how to modify the call data to bypass call data location based restrictions -> creating modifiers based on a data with respect to the location of the call data is riskier