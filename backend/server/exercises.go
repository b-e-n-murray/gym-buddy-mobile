package server

import (
	"encoding/json"
	"fmt"
	workout "gym_buddy_mobile/backend/domain"
	"io"
	"log"
	"net/http"
	"strings"
)

type GetAllExercisesResponse struct {
	Success bool
	Data    ExercisesData
}

type ExercisesData struct {
	Exercises []workout.Exercise
}

type GetExerciseResponse struct {
	Success bool
	Data    ExercisesData
}

type ExerciseData struct {
	Exercise workout.Exercise
}

func HandleGetAllExercisesRequest(w http.ResponseWriter, r *http.Request) {
	fmt.Print("received /exercises request\n")
	if err := getAllExercises(); err != nil {
		log.Fatal(err)
	}
}

func HandleGetExerciseRequest(w http.ResponseWriter, r *http.Request) {
	fmt.Print("received /exercises/id request")
	id := strings.Split(r.RequestURI, "/")[2]
	if err := getExercise(id); err != nil {
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

	resp := GetAllExercisesResponse{}
	if err = json.Unmarshal(body, &resp); err != nil {
		fmt.Printf("unmarshalling getAllExercises response: %v", err)
		return err
	}

	if !resp.Success {
		fmt.Print("WARN: getAllExercises response marked as unsuccessful")
	}

	fmt.Println(resp)

	return nil
}

// getExercise makes an API call to fetch an exercise from the db matching the provided id.
func getExercise(id string) error {
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

	resp := GetExerciseResponse{}
	if err = json.Unmarshal(body, &resp); err != nil {
		fmt.Printf("unmarshalling getExercise response: %v", err)
		return err
	}

	if !resp.Success {
		fmt.Print("WARN: getExercise response marked as unsuccessful")
	}

	fmt.Println(resp)

	return nil
}
