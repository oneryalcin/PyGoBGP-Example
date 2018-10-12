# gRPC files

Files here are not needed as PyGoBGP handles the gRPC calls, however I decided to keep gobgp gRPC file and populated python files for stub for reference. 
 `gobgp.proto` defines the gRPC API and other python files are populated from `gobgp.proto` file. If any developer want to add more features to `PyGoBGP`, then `gobgp.proto` defines all endpoints.  

Note that `gobgp.proto` file is from `gobgp` v1.25


## How to populate python libraries from protocol buffer file `gobgp.proto`

**Download GOBGP proto file**
```
wget https://raw.githubusercontent.com/osrg/gobgp/v1.25/api/gobgp.proto
```

**Install Python GRPC libs**
```
pip install grpcio grpcio-tools googleapis-common-protos
```

**Populate python GRPC API classes to interact with GOBGP**
```
python -m grpc_tools.protoc -I. --python_out=. --grpc_python_out=. gobgp.proto
```

**Now we have the following files available**
```
    gobgp_pb2_grpc.py
    gobgp_pb2.py
```
