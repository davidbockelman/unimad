package main

import (
	"fmt"
	"os"
	"time"
	"context"
	"strconv"
	"google.golang.org/grpc"
	pb "github.com/davidbockelman/unimad-client/proto"
)

func sendHeartbeat(heartbeat_server int, clientId string) int {
	// Step 1: Connect to the gRPC server at localhost:9001
	port := strconv.Itoa(heartbeat_server + 9000)
	conn, err := grpc.Dial("localhost:" + port, grpc.WithInsecure()) // Use grpc.WithTransportCredentials() for secure connections
	if err != nil {
		fmt.Printf("could not connect: %v", err)
	}
	defer conn.Close()

	// Step 2: Create a new KVStore client
	client := pb.NewKeyValueStoreClient(conn)

	// Step 3: Prepare the PutRequest with the key and value
	req := &pb.StringArg{
		Arg: clientId,
	}

	// Step 4: Call the Put RPC and get the response
	resp, err := client.ClientHeartbeat(context.Background(), req)
	if err != nil {
		fmt.Printf("could not send client heartbeat: %v", err)
	}


	if resp.WrongLeader {
		num, _ := strconv.Atoi(resp.Value)
		return num
	} 
	return heartbeat_server
}


func main() {
	client_id := os.Args[1]
	timeout := 100 * time.Millisecond
	heartbeat_server := 1

	for {
		heartbeat_server = sendHeartbeat(heartbeat_server, client_id)

		time.Sleep(timeout)
	}
}
