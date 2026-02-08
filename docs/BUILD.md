# Building Multiplier

Building Multiplier requires modern Solidity development tools. You will need 
Node.js (20+), Foundry, and Python (3.12+) to build and use Multiplier.

* [Step 0](#step-0)
  + [Dependencies](#dependencies)
* [Step 1](#step-1)
  + [macOS](#macos)
    - [Homebrew](#homebrew)
    - [Build tools](#build-tools)
  + [Linux](#linux)
    - [Node.js](#nodejs)
    - [Foundry](#foundry)
    - [Python](#python)
* [Step 2: Environment](#step-2--environment)
* [Step 3: Download and build Multiplier](#step-3--download-and-build-multiplier)
  + [Configuring](#configuring)
    - [macOS](#macos-1)
    - [Linux](#linux-1)
  + [Build & Install](#build---install)

## Step 0

Going forward, we assume the environment variable `WORKSPACE_DIR` dir represents
the directory where everything goes.

### Dependencies

| Name | Version |
| ---- | ------- |
| [Git](https://git-scm.com/) | Latest |
| [Node.js](https://nodejs.org/) | 20+ |
| [Foundry](https://book.getfoundry.sh/) | Latest |
| [Python](https://www.python.org/) | 3.12+ |

## Step 1

### macOS

#### Homebrew

Make sure that you have Homebrew installed. At a command line, you should be able
to run `brew --version` and see output.

```shell
% brew --version
Homebrew 4.2.0
```

If you don't have Homebrew installed, visit [https://brew.sh/](https://brew.sh/) to install it.

#### Build tools

Make sure that you have Node.js and Foundry installed. On macOS, you
can [install Homebrew](https://brew.sh/) and run the following:

```shell
brew install node
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### Linux

#### Node.js

Install Node.js (version 20+):

```shell
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
```

Verify the installation:

```shell
node --version
npm --version
```

#### Foundry

Install Foundry (Forge, Cast, Anvil):

```shell
curl -L https://foundry.paradigm.xyz | bash
source ~/.bashrc
foundryup
```

Verify the installation:

```shell
forge --version
cast --version
anvil --version
```

#### Python

You will need to have Python headers and libraries installed, ideally for
Python 3.12+. Python is used for running analysis scripts and tools.

```shell
sudo apt install python3.12 python3-pip python3.12-dev
```

Install Python analysis tools:

```shell
pip3 install slither-analyzer solc-select mythril
```

## Step 2: Environment

```shell
mkdir -p "${WORKSPACE_DIR}/src"
mkdir -p "${WORKSPACE_DIR}/install"
```

Set up a Python virtual environment (optional but recommended):

```shell
if [[ ! -f "${WORKSPACE_DIR}/install/bin/activate" ]]; then
  python3.12 -m venv "${WORKSPACE_DIR}/install"
fi
source "${WORKSPACE_DIR}/install/bin/activate"
```

## Step 3: Download and set up Multiplier

Clone the Multiplier repository:

```shell
cd "${WORKSPACE_DIR}/src"
git clone git@github.com:trailofbits/multiplier.git
cd multiplier
```

### Installing Dependencies

#### macOS

Install Node.js dependencies:

```shell
npm install
```

#### Linux

Install Node.js dependencies:

```shell
npm install
```

### Build & Install

Build the project:

```shell
npm run build
```

Run tests (if available):

```shell
npm test
```

Alternatively, you can use Foundry:

```shell
forge build
forge test
```
