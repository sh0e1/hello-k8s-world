package main

import (
	"fmt"
	"log"
	"net/http"
)

var version string

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "Hello k8s World")
		if version != "" {
			fmt.Fprintf(w, "\nversion: %s", version)
		}
	})

	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal(err)
	}
}
