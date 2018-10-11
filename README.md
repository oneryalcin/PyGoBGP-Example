# PyGoBGP

PyGoBGP is a very basic python package to interact with GOBGP (currently briefly tested on only GoBGP v1.25)

# Install

PyGoBGP is not on CheeseShop so install from GitHub 
```
pip install git+https://github.com/oneryalcin/PyGoBGP.git
```

## Usage 
PyGoBGP comes with protocol buffers generated `py` files for GoBGP v1.25 only. 

Example Topology:

```
GoBGP address: 10.0.255.2
GoBGP Local AS: 65412

Remote address: 10.0.255.3
Remote Peer AS: 65001
```

Connect to GoBGP instance, default port is `50051` if not specified 

```
from gobgp import PyGoBGP
gobgp = PyGoBGP(address="10.0.255.2")
```

### Get Neighbor Params
```
neigbor = gobgp.get_neigbor(address="10.0.255.3")
print(neighbor)

families: 65537
...
conf {
  local_as: 64512
  neighbor_address: "10.0.255.3"
  peer_as: 65001
  ...
  local_address: "10.0.255.2"
}
info {
  ...
  bgp_state: "established"
}
...
```

### Get Global BGP RIB-IN 

Assume remote peer has following route and will advertise to GoBGP:
```
{
    'prefix': '50.30.16.0/20',
    'as_path': [5607, 1000],
    'next_hop': '60.1.2.3',
    'community': ['1000:2000', '3000:4000'],
    'med': 20
}  

```

```
routes = gobgp.get_rib()
print(routes)

[{'prefix': '50.30.16.0/20',
  'as_path': [65001, 5607, 1000],
  'next_hop': '60.1.2.3',
  'community': ['1000:2000', '3000:4000'],
  'med': 20}]
```
Note that AS 65001 is prepended as it is an eBGP session.

### Remove Neighbor

```
gobgp.delete_neighbor(address="10.0.255.3")
neigbor = gobgp.get_neigbor(address="10.0.255.3")
print(neigbor)

None

```


### Add neighbor back

First define neigbor params
```
neighbor = {
    "local_address": "10.0.255.2",
    "neighbor_address": "10.0.255.3",
    "local_as": 64512,
    "peer_as": 65001,
}
gobgp.add_neighbor(**neighbor)
```

```
neigbor = gobgp.get_neigbor(address="10.0.255.3")
print(neighbor)

families: 65537
...
conf {
  local_as: 64512
  neighbor_address: "10.0.255.3"
  peer_as: 65001
  ...
  local_address: "10.0.255.2"
}
info {
  ...
  bgp_state: "established"
}
...
```

### Route Injection
Upcoming

