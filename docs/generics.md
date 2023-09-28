# GENERICS (GT3LT7)

n output: input -> AL -> outputs
n input: inputs -> AL -> output
n io: inputs -> AL -> outputs

context:

- input
- output
- al
- user
- system

layer:

- physical
- virtual (model)

input:

- id
- user
- payload

output:

- where
- when

al:

- preprocessing
- lexing
- parsing
- assembling
- linking

phase:

- add local dependencies
- add global dependencies
- remove unnecessary
- evaluate
- end cycle
  toolchain:
- lexer: flex
- parser: bison
- assembler
- linker: ld
- ast
- grammar
- compiler: gcc/llvm

rtlib: runtime library
stdlib: standard library
fsm: state machine

notes:

- parser
- analysis:
  - lexical
  - syntax
  - semantics
- optimisation:
  - dead code
  - overflow
  - superposition
- codegen

every living thing is always in a state of superposition of idle and non-idle and to
know the current state, you probe it at a given
time provided you have its location at that point in time.

cpu: you
memory: location
target: in memory representation

---

Copyright © 2023 Schubert Anselme. All rights reserved.
