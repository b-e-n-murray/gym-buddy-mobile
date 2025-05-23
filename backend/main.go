package main

import (
	"errors"
	"fmt"
	exercises "gym_buddy_mobile/backend/server"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/exercises", exercises.HandleGetAllExercisesRequest)
	http.HandleFunc("/exercises/id", exercises.HandleGetExerciseRequest) // TODO: pattern to include id from client.

	err := http.ListenAndServe(":3000", nil)
	if errors.Is(err, http.ErrServerClosed) {
		fmt.Printf("server closed\n")
	} else if err != nil {
		fmt.Printf("error starting server: %s\n", err)
		os.Exit(1)
	}
}
