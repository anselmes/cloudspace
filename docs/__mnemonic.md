# MNEMONICS

```txt
~> may emit an event
-> emits an event
```

```txt
: label
() component
# nop
$ static
/ supperimposed
` context/fence
```

```txt
. iddle (#/$)/observer
<> from (#/()) delegate/proxy
>< pipeline (#/(#/$)) (from/(delegate/proxy))
```

SYMBOL/label/COMPONENT external/implementation/internal in/hal/out

```
_ first
z last
```

```
__ first (2x)
zz last (2x)
```

```
asm8~>genesis~>cruiser->svc (bootstrap) # potentially insecure
asm128~>genesis~>cloud->svc (bootstrap->cloud) # eventually secure

NOTE:
  whitespace: next/recycle/reset

  asm8:
    may emit a genesis event
    may emit a cruiser event
    emits a svc event

  asm128:
    may emit a genesis event
    may emit a cloud event
    emits a svc event

  to:
    form bootstrap component
    with asm8:
      may potentially be insecure
    with asm128:
      will eventually be secure

  states:
    idle
    non-idle:
      potentially insecure
      validated insecure
      eventually insecure
      validated secure
```

---

Copyright (c) 2023 Schubert Anselme. All rights reserved.
