# <h1 align="center"> Foundry x Vyper Template </h1>

<p align="center"><b>Template repository for getting started quickly with Vyper using a Foundry project</b></p>

## Setup

Click **Use this template** on GitHub to create a new repository with this repo as the initial state.

## 🌀 Dependencies

You will need the following dependencies:

- [Git](https://git-scm.com)
- [Node.js](https://nodejs.org)
- [pnpm](https://pnpm.io)
- [🐍Vyper](https://github.com/vyperlang/vyper)
- [Foundry](https://github.com/foundry-rs/foundry)

## Installation

For direct local use, use the following Forge command to create a new project (replace `project` with your project name):

```bash
forge init --template https://github.com/Patronum-Labs/foundry-vyper <project>
```

## Project Structure

```ml
├── src/
│   └── Greeting.vy              # Vyper contract
├── test/
│   └── Greeting.t.sol           # Solidity tests for the Vyper contract
├── script/
│   └── Greeting.s.sol           # Deployment scripts
├── interfaces/
│   └── IGreeting.sol            # Interfaces for the contracts
└── foundry.toml

```

### Directory Explanations

- **src/:** This is where your Vyper contracts are located.
- **test/:** This is where you write Solidity tests for your Vyper contracts.
- **script/:** This is where you write scripts to deploy your contracts.
- **interfaces/:** This is where you create interfaces for the contracts you want to test or use in scripts.

## Compiling Vyper Contracts

To compile a Vyper contract, use the following command:

```bash
vyper src/Greeting.vy
```

Make sure you have Vyper version 0.4.0 or higher:

```bash
vyper --version
> 0.4.0+commit.e9db8d9
```

## Testing

To run tests, use the following command:

```bash
forge test
```

## Deployment

To deploy your contracts using the script, you need to add `PRIVATE_KEY` in the `.env` file.

Then run the deployment script with the following command (replace `<YOUR_RPC>` with a link to an RPC provider):

```bash
forge script script/Greeting.s.sol:GreetingScript --rpc-url <YOUR_RPC> --broadcast
```

## Acknowledgments

This repository is inspired by and uses code from the following projects:

- [pcaversaccio/snekmate](https://github.com/pcaversaccio/snekmate)
- [0xKitsune/Foundry-Vyper](https://github.com/0xKitsune/Foundry-Vyper)
- [foundry-rs/forge-template](https://github.com/foundry-rs/forge-template)

We are grateful to the authors and contributors of these projects for their valuable work and inspiration.
