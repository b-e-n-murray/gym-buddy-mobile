package exercises

import (
	"fmt"
	workout "gym_buddy_mobile/backend/domain"
	"io"
	"log"
	"net/http"
)

// getAllExercises makes an API call to fetch all exercises from db.
func getAllExercises() []workout.Exercise {
	res, err := http.Get("https://exercisedb-api.vercel.app/api/v1/exercises")
	if err != nil {
		log.Fatal(err)
	}
	defer res.Body.Close()

	body, err := io.ReadAll(res.Body)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(string(body))

	return []workout.Exercise{}
}

// getExercise makes an API call to fetch an exercise from the db matching the provided id.
func getExercise(id string) workout.Exercise {
	url := fmt.Sprint("https://exercisedb-api.vercel.app/api/v1/exercises/%s", id)
	res, err := http.Get(url)
	if err != nil {
		log.Fatal(err)
	}
	defer res.Body.Close()

	body, err := io.ReadAll(res.Body)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(string(body))

	return workout.Exercise{}

}
