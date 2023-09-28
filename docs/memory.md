# MEMORY

## system layer (cl) - firmware

### System: (root of trust/system calls)

- rot
- core
- io

## provider layer (cl1) - kernel

### Context: (switch &| route context)

- controller
- gateway

## operator layer (cl2) - os

### Site: (cloud hal)

- harbor
- depot
- carriers
- cruisers
- services

## interface layer (cl3) - svc

- events

```
rot: 1 (pubi)
core: 5
io: 0
controller: 2 (sw, rt)
gateway: 4 (sio, soi, rio, roi)
event: 8 (svc)
```

t: proto

---

Copyright (c) 2023 Schubert Anselme. All rights reserved.
