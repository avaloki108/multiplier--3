# Other Indexers

Why are typical code indexers, such as [solidity-analyzer](https://github.com/ConsenSys/solidity-analyzer), [Slither](https://github.com/crytic/slither), [Mythril](https://github.com/ConsenSys/mythril), etc., insufficient for Solidity code?

### How does a typical code indexer work?

Most indexers store subject-predicate-object triples:
 * Subject: Contract name, function signature, state variable name, etc.
 * Predicate: called-from, emits, modifies, inherits-from, etc.
 * Object: `file:line:column` source location, or a subject

Indexers then provide the appearance of understanding the semantics of code by using the triple format above to implement verb-specific queries, e.g. find me all contracts that inherit from this interface, and "clickable" code, i.e. by matching source locations to subjects/objects during code rendering / visualization.

### Why is the typical code indexing approach insufficient for Solidity?

First, **the semantic depth is fundamentally limited by the predicate space**. If you want more information, then you need to modify the indexer to record triples containing new predicates. We suffered this problem in [Multiplier v1](https://github.com/trailofbits/multiplier-old) and don't want to repeat it. In general, Multiplier strives to minimize the need for users to ask for API extensions by maximizing the amount of information is available by default. That is a key motivation for why we try to comprehensively cover the Solidity AST API.

Second, **Solidity code involves complex inheritance patterns, and source locations cannot convey the semantic depth needed to enable *context-sensitive* source navigation**. A user that is browsing code should be able to ask for all functions that call a specific inherited function, and discover which contract's implementation is being invoked. Then, the user should be able to ask for callers of specific function overrides, and find *only* those calls that are specific to that contract's implementation.

Thus, typical code indexers are 1-context-sensitive, but not n-context-sensitive. That is, from a given point, they can follow a triple to the relevant location, but once there, further navigation uses file locations as the source of truth, and thus loses sensitivity.