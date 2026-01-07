package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)
func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello World")
}

func hostnameHandler(w http.ResponseWriter, r *http.Request) {
	name, err := os.Hostname()
	if err != nil {
		fmt.Fprintf(w, "Error retrieving hostname: %v", err)
		return
	}
	fmt.Fprintf(w, "%s", name)
}

func main() {
	http.HandleFunc("/", helloHandler)
	http.HandleFunc("/hostname", hostnameHandler)

	fmt.Println("Server starting on port 80...")
	

	log.Fatal(http.ListenAndServe(":80", nil))
}