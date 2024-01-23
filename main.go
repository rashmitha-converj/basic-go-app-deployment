package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello, World! Rashmitha \n")
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Server is running on http://0.0.0.0:3001")
	http.ListenAndServe("0.0.0.0:3001", nil)
}
