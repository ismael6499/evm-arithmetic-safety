# 🧮 Calculator App - Solidity Smart Contract

Welcome to the first project of my **Master in Blockchain Development** portfolio at the **Blockchain Accelerator Academy**.

As a **Java Software Engineer** transitioning into the Web3 space, I am documenting my journey by building smart contracts that explore the depths of the Ethereum Virtual Machine (EVM). This repository contains a robust **Calculator Smart Contract** that goes beyond simple arithmetic to implement on-chain constraints and validations.

## 💡 Project Overview

The **Calculator App** is a smart contract that performs addition, subtraction, multiplication, division, and exponentiation. The key challenge here was not the math itself, but handling it efficiently within the EVM context.

### 🔍 Key Technical Features:

* **Custom Modifiers:** Implemented `checkMaxPowerNumber` and `checkNotZero` to handle input validation cleanly. Unlike Java's exception handling, these modifiers ensure gas isn't wasted on invalid operations before execution starts.
* **Signed vs. Unsigned Integers:** The contract explicitly handles `uint256` and `int256` to support negative results in subtraction and division, a crucial distinction in Solidity.
* **Internal Logic Separation:** Usage of `internal` functions (like `substraction_logic`) to keep the public interface clean and secure.
* **Event Logging:** Emitted `Addition` and `Substraction` events, allowing off-chain applications (front-ends) to listen for state changes.

## 🛠️ Stack & Tools

* **Language:** Solidity `^0.8.24`
* **License:** LGPL-3.0-only
* **Concepts Applied:** Modifiers, Event emission, Visibility (Public/Internal/Pure), and Error handling.

---

*This project marks the beginning of my specialized training in Blockchain architecture.*