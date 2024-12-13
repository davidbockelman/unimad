package main

import (
	"fmt"
	"os"
	"os/exec"
	"context"
	"github.com/spf13/cobra"
	"google.golang.org/grpc"
	pb "github.com/davidbockelman/unimad/proto"
)

func registerPut(key, value string) {
	// Step 1: Connect to the gRPC server at localhost:9001
	conn, err := grpc.Dial("localhost:9001", grpc.WithInsecure()) // Use grpc.WithTransportCredentials() for secure connections
	if err != nil {
		fmt.Printf("could not connect: %v", err)
	}
	defer conn.Close()

	// Step 2: Create a new KVStore client
	client := pb.NewKeyValueStoreClient(conn)

	// Step 3: Prepare the PutRequest with the key and value
	req := &pb.KeyValue{
		Key:   key,
		Value: value,
		ClientId: 1,
		RequestId: 1,
	}

	// Step 4: Call the Put RPC and get the response
	resp, err := client.Put(context.Background(), req)
	if err != nil {
		fmt.Printf("could not put: %v", err)
	}

	// Step 5: Print the response
	fmt.Printf("Response: %v\n", resp)
}



func spawnRaftInstances() error {
	path := "/home/david/Documents/CS380D/unimad/unikernel"
	numServers := 3
	stdout, _ := os.Create(fmt.Sprintf("%s/raft.log", path))
	// if err != nil {
	// 	return fmt.Errorf("failed to create stdout file: %w", err)
	// }
	defer stdout.Close()

	for i := 1; i <= numServers; i++ {
		// Construct the command with arguments
		cmdPath := fmt.Sprintf("%s/dist/raft", path)
		cmd := exec.Command(cmdPath, "-i", fmt.Sprintf("%d", i), "-n", fmt.Sprintf("%d", numServers))
		// println(fmt.Sprintf("%s/raft.log", path))
		// Set the command's stdout and stderr to the parent's stdout and stderr
		cmd.Stdout = stdout
		cmd.Stderr = stdout
		// Start the command
		cmd.Start()
		// if err := cmd.Start(); err != nil {
		// 	return fmt.Errorf("failed to start raft instance %d: %w", i, err)
		// }

		// fmt.Printf("Started raft instance %d with PID %d\n", i, cmd.Process.Pid)
	}
	return nil
}

func killRaftInstances() {
	// Run pkill -f to kill processes with "raft" in their command line
	cmd := exec.Command("pkill", "-f", "raft")
	cmd.Run()
	// if err != nil {
	// 	fmt.Println("Failed to kill processes with 'raft' in the command line.")
	// } else {
	// 	fmt.Println("Killed all processes with 'raft' in the command line.")
	// }
}


func main() {
	// Root command (unimad)
	var rootCmd = &cobra.Command{
		Use:   "unimad",
		Short: "Unimad CLI tool",
		Long:  "Unimad is a CLI tool to start, register, submit commands, and stop.",
	}

	// "start" command
	var startCmd = &cobra.Command{
		Use:   "start",
		Short: "Start the Unimad service",
		Run: func(cmd *cobra.Command, args []string) {
			spawnRaftInstances()
			fmt.Println("Unimad service started.")
		},
	}

	// "register" command
	var registerCmd = &cobra.Command{
		Use:   "register <addr>",
		Short: "Register an address",
		Args:  cobra.ExactArgs(1),
		Run: func(cmd *cobra.Command, args []string) {
			addr := args[0]
			registerPut("add client", addr)
			fmt.Printf("Address '%s' registered successfully.\n", addr)
		},
	}

	// "submit" command
	var submitCmd = &cobra.Command{
		Use:   "submit <cmd>",
		Short: "Submit a command to Unimad",
		Args:  cobra.ExactArgs(1),
		Run: func(cmd *cobra.Command, args []string) {
			command := args[0]
			fmt.Printf("Command '%s' submitted successfully.\n", command)
		},
	}

	// "stop" command
	var stopCmd = &cobra.Command{
		Use:   "stop",
		Short: "Stop the Unimad service",
		Run: func(cmd *cobra.Command, args []string) {
			killRaftInstances()
			fmt.Println("Unimad service stopped.")
		},
	}

	// Add subcommands to the root command
	rootCmd.AddCommand(startCmd, registerCmd, submitCmd, stopCmd)

	// Execute the root command
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
