# ASSEMBLY (asm8128)

```asm
sw: (sw 0x0000) print()
rt: (rt 0x0000) printf()
gw: (sw&|rt 0x0000) branch
sio (0x01) print (no ctx)
soi (0x1F) not implemented
rio (0x10) printf (ctx)
roi (0xFF) not implemented

rot: (privi&|pubi 0x0) true
pubi (0x0) 0
privi (0xF) not implemented

svc (0x00000000) main()
core (0x00000) cpu
event (string) “hello world”
io (0x00000000) console

nop (0x00) 0
```

```
immc:
  imm:  immediate (x1)
  immr: rot <> pubi/privi (x1(x2)) >< (x2)
  imms|immr|immg: sw/rt/gw <> rot (x2(x2)) >< (x2)
  immt: t <> imms <> imm (x1(x2(x))) >< (./$/><)
```

```
imme:
  nop:
    imm cmp
    imm enc
  read:
    imm cmpp # ref
    imm cmpd # val
  write:
    imm encp # ref
    imm encd # val
```

t: lang

---

Copyright (c) 2023 Schubert Anselme. All rights reserved.
