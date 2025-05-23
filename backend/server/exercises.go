package exercises

import (
	"fmt"
	"io"
	"log"
	"net/http"
)

func HandleGetAllExercisesRequest(w http.ResponseWriter, r *http.Request) {
	fmt.Print("received /exercises request")
	if err := getAllExercises(); err != nil {
		log.Fatal(err)
	}
}

func HandleGetExerciseRequest(w http.ResponseWriter, r *http.Request) {
	fmt.Print("received /exercises/id request")
	if err := getExercise("id"); err != nil { // TODO: Take id from request.
		log.Fatal(err)
	}
}

// getAllExercises makes an API call to fetch all exercises from db.
func getAllExercises() error {
	res, err := http.Get("https://exercisedb-api.vercel.app/api/v1/exercises")
	if err != nil {
		return err
	}
	defer res.Body.Close()

	body, err := io.ReadAll(res.Body)
	if err != nil {
		return err
	}
	fmt.Println(string(body))

	// TODO: Assign response to domain type(s) and persist.

	return nil
}

// getExercise makes an API call to fetch an exercise from the db matching the provided id.
func getExercise(id string) error {
	fmt.Printf("received /exercises/%s request", id)
	url := fmt.Sprintf("https://exercisedb-api.vercel.app/api/v1/exercises/%s", id)
	res, err := http.Get(url)
	if err != nil {
		return err
	}
	defer res.Body.Close()

	body, err := io.ReadAll(res.Body)
	if err != nil {
		return err
	}
	fmt.Println(string(body))

	// TODO: Assign response to domain type(s) and persist.

	return nil
}
