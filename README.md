# _Multiplier_ finds more bugs faster

Multiplier provides precise and comprehensive code understanding capabilities for Solidity smart contracts.
It does so by saving build artifacts into a database, and then making them
persistently accessible using a Python or JavaScript API.

Multiplier emphasizes the ability to uniquely identify *all* entities in a build
process, including individual tokens, AST nodes, and intermediate
representations. With Multiplier, an analyst can identify code patterns of
interest over one of the representations, and then accurately relay results back
to humans in a readable form, or to follow-on scripts via entity IDs.

Multiplier's APIs are extensive, and often provide as-good or better-than
compiler-level quality information, but linked at a whole-program granularity.
We like to say that with its APIs, *you can get everywhere from anywhere*.

* About
  * [How do other indexers work](docs/other-indexers.md), and why the normal way of indexing code is insufficient for Solidity
  * [Why Multiplier?](docs/why-multiplier.md) What analysis challenges does Multiplier solve?
* Usage
  * [Getting and building the code](docs/BUILD.md)
  * [Installing a pre-built release](docs/INSTALLING.md)
  * [How to index a codebase](docs/INDEXING.md)
* Writeups
  * [Solidity reentrancy vulnerability analysis](docs/solidity-reentrancy-analysis.md)
  * [Smart contract audit case studies](docs/smart-contract-audits.md)
* Included Python tools
  * [Web-based code browser for browsing Solidity code from a database](docs/web-browser.md)
  * [Group functions by visibility and type](docs/group-functions.md)
* Included Analysis tools
  * [Find function calls in contract deployments](docs/mx-find-calls-in-contract-deployments.md)
  * [Find possible reentrancy vulnerabilities](docs/mx-find-reentrancy-candidates.md)
  * [Find unchecked external calls](docs/mx-find-unchecked-calls.md)
  * [Find contracts with state-changing functions](docs/mx-find-state-changing-functions.md)
  * [Find dangerous type conversions and casts](docs/mx-find-dangerous-casts.md)
  * [Extract a contract and all of its dependencies into a file](docs/mx-harness.md)
  * [Highlight a specific entity within its surrounding code](docs/mx-highlight-entity.md)
  * [Highlight all references to an entity](docs/mx-highlight-references.md)
  * [Print a call graph](docs/mx-print-call-graph.md)
  * [Print the reference graph](docs/mx-print-reference-graph.md)
  * [Print a graph relating source code, parsed tokens, and AST nodes](docs/mx-print-token-graph.md)
  * [Print the taint graph given a taint source for security analysis](docs/mx-taint-entity.md)
* Included utilities
  * [Find entities in the database given a symbol name](docs/mx-find-symbol.md)
  * [List all indexed files](docs/mx-list-files.md)
  * [List all indexed functions](docs/mx-list-functions.md)
  * [List all indexed events and modifiers](docs/mx-list-events.md)
  * [List all redeclarations of a given entity](docs/mx-list-redeclarations.md)
  * [List all indexed contracts/interfaces/libraries](docs/mx-list-contracts.md)
  * [List all indexed state variables](docs/mx-list-variables.md)
  * [Search the code with regular expressions](docs/mx-regex-query.md)

# License

This research was developed with funding from the Defense Advanced Research
Projects Agency (DARPA). The views, opinions and/or findings expressed are those
of the author and should not be interpreted as representing the official views
or policies of the Department of Defense or the U.S. Government.

Distribution Statement "A" (Approved for Public Release, Distribution
Unlimited).
