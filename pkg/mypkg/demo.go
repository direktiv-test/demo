package mypkg

import (
	"encoding/json"
	"net/http"
)

type ret struct {
	Name string
}

func Handler(w http.ResponseWriter, r *http.Request) {
	ret := &ret{
		Name: "jens",
	}
	w.Header().Set("Content-Type", "application/json")
	err := json.NewEncoder(w).Encode(ret)
	if err != nil {
		panic("does not work")
	}
}
