# 🛡️ EVM Arithmetic Safety & Logic Encapsulation

![Solidity](https://img.shields.io/badge/Solidity-0.8.24-363636?style=flat-square&logo=solidity)
![License](https://img.shields.io/badge/License-LGPL_3.0-blue?style=flat-square)

A reference implementation exploring **arithmetic safety** within the EVM, focusing on mixed-type operations (Signed vs. Unsigned), gas-efficient validation patterns, and strict logic encapsulation.

Unlike high-level languages where arithmetic is abstracted, Solidity requires rigorous handling of storage slots and overflow protection. This project serves as a pattern for handling `int256` state changes and enforcing "Fail Early" mechanisms.

## 🏗 Architecture & Patterns

### 1. Type Safety (Signed vs. Unsigned)
- **Mixed State Strategies:** The contract explicitly handles `int256` for operations that may result in negative balances or values (Subtraction/Division), demonstrating awareness of EVM storage behavior for signed integers vs. standard `uint256` usage.
- **Underflow/Overflow Protection:** Leverages Solidity 0.8.x built-in overflow checks while maintaining explicit logic for business-rule constraints.

### 2. Gas Optimization
- **Custom Errors vs Strings:** Replaced standard `require(condition, "Message")` with custom `error DivisionByZero()` and `error MaxPowerExceeded()`.
    - *Impact:* Reduces bytecode size and runtime gas costs during revert operations.
- **Fail-Early Modifiers:** Implementation of declarative validation (`checkMaxPowerNumber`) to decouple security checks from core business logic, ensuring transactions revert before executing heavy arithmetic opcodes.

### 3. Encapsulation & Observability
- **Internal Logic Separation:** Core logic (e.g., `_subtractionLogic`) is isolated in `internal pure` functions, reducing the attack surface of the public API.
- **Event Logging:** Emission of indexed events (`Addition`, `Subtraction`) to allow off-chain indexers (The Graph) to track state changes without querying contract storage.

## 🛠 Tech Stack

* **Language:** Solidity `^0.8.24`
* **Features:** Custom Errors, Modifiers, Event Logging
* **License:** LGPL-3.0-only

## 📝 Contract Interface

The system exposes a secured API for arithmetic operations:

```solidity
// Example of secured entry point
function power(uint256 _num1) external checkMaxPowerNumber(_num1) {
    result = result ** _num1;
}
```

---
*Reference implementation for secure arithmetic handling on Ethereum.*
