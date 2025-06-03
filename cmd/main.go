package main

import (
	"github/direktiv-test/demo/pkg/mypkg"
	"net/http"
	"time"
)

func main() {
	server := &http.Server{
		Addr:              ":9191",
		ReadHeaderTimeout: 3 * time.Second,
	}

	http.HandleFunc("/", mypkg.Handler)

	err := server.ListenAndServe()
	if err != nil {
		panic(err)
	}
}
