# INSTRUCTIONS

```
ask -> event
tell ~> event
```

```
switch (2:32)
route (2:32)
gateway (sw&|rt - 4:64)

rot (1)
core (5)
event (8:128)
nop (0)
```

```
ask (ask)
ask rot (askr)
ask core (askc)
ask event (aske)
ask gateway (askg)
ask a switch (asks)
ask a route (askr)

tell (tell)
tell rot (tellr)
tell core (tellc)
tell event (telle)
tell gateway (tellg)
tell a switch (tells)
tell a route (tellr)
```

```
asktell (immediate)
asktells (system cycles)
asktelle (all cycles)
asktelln (n cycles)
```

---

Copyright (c) 2023 Schubert Anselme. All rights reserved.
