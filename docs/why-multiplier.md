# Why Multiplier?

**What analysis challenges does Multiplier solve?**

Most program analyses operate on at most one representation, e.g. a program's
AST, bytecode, or compiled EVM code. These analyses use approximate source 
location information embedded to report their results back to users. Then, 
it's up to the user to open their code editor of choice, find the relevant 
lines of code, and stare hard at them until the results make sense. This 
process fails on two key fronts.

First, focusing on a single abstract program representation limits the scope of
what can be achieved with program analysis. There is no one-size-fits-all
program abstraction. High-level representations are dense and rely on implicit
behaviors. Low-level representations (like EVM bytecode) are more efficiently 
analyzable but also harder to relate to source. Exploits cross the semantic gap, 
from logic bugs that are apparent only in high-level source (like reentrancy), 
to gas optimization opportunities that are knowable only in low-level
representations. What is needed are multiple representations that can span this
semantic gap, enabling analyses to operate at the best-fit level, without losing
the connection back to source.

Second, code locations are approximate, and even when precise, they may point
the user to "unhelpful" locations, such as inherited contract implementations, 
or interface definitions that, only through concrete implementations, take on 
concrete meaning. Having a user navigate to these locations is only slightly 
burdensome. The true loss in capability is the inability for users to create 
workflows that leverage results produced by one analysis and use them in another 
analysis. How is a second analysis supposed to do anything meaningful when a 
first analysis tells us about a polymorphic source location like a line of code 
inside of an interface definition or inherited contract?

The crux of the problem is that the source of truth for typical code indexers,
language servers, code editors, and even debugging formats is the
`file:line:column` source location triple. Source locations cannot express that
some code is part of an inherited contract or interface implementation. In fact, 
the most reliable way to follow code references while maintaining the proper
context-sensitivity is to browse the compiled bytecode. This is because bytecode 
has already been monomorphized: contract inheritance and interface implementations 
produce different bytecode.

Multiplier provides precise, and comprehensive code understanding capabilities
by storing a compressed representation of build artifacts, called entities, in
an index database. Entities in Multiplier's index include files, tokens,
abstract syntax tree (AST) nodes, and compiled bytecode. Each entity is uniquely 
identified by a 64 bit integer, and is available through scripting in Python or
JavaScript as a fully formed object with methods. For example, the AST entities 
(contract declarations, function definitions, state variables, etc.) are
persistent forms of AST nodes found in the Solidity compiler, and the
methods available on these entities mirror those that can be called on those
objects. Although Multiplier uses the Solidity compiler, it breaks
from it in how it represents and relates entities to source code. Whereas the 
compiler stores source locations, Multiplier stores token entity IDs. Token 
entities can belong to files, inherited contracts, or interface implementations. 
In the latter two cases, inherited and interface tokens can relate back to file 
tokens. This allows polymorphic code, e.g. an overridden function declaration 
AST node, to have its own version of the source code.
