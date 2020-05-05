#!/bin/sh
PROTO_FILES=""

for protoFile in ./src/main/proto/*
do
  echo generating grpc and protobuf code from "\033[31m"$protoFile"\033[0m"
  PROTO_FILES=$PROTO_FILES' '$protoFile
done

#generating grpc and protobuf code
protoc --plugin=./protoc-gen-grpc-java \
  --grpc-java_out=./src/main/java --proto_path=./src/main/proto \
  -I=./src/main/proto --java_out=./src/main/java \
  $PROTO_FILES