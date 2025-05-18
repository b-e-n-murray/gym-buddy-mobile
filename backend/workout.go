package workout

import (
	"time"

	"github.com/google/uuid"
)

type Workout struct {
	ID            uuid.UUID
	Name          string
	Exercises     []Exercise
	TargetMuscles []Muscle
	CreatedDate   time.Time
	Favourite     bool
}

type Exercise struct {
	ID            uuid.UUID
	Name          string
	TargetMuscles []Muscle
	Favourite     bool
}

type Muscle string

// TODO: Create enum.

// var Muscles = map[Muscle]string{
// 	Chest: "Chest",
// 	Back: "Back",
// 	Shoulders: "Shoulders",
// }

func NewWorkout(name string, exercises []Exercise) Workout {
	return Workout{
		ID:          uuid.New(),
		Name:        name,
		Exercises:   exercises,
		CreatedDate: time.Now(),
		Favourite:   false,
	}
}

// AddExercises adds the provided exercise(s) to a workout if they do not already exist.
func (w Workout) AddExercises(exercises ...Exercise) {
	for _, e := range exercises {
		for _, wke := range w.Exercises {
			if wke.Name != e.Name {
				w.Exercises = append(w.Exercises, e)
			}
		}
	}
}

// RemoveExercises removes the provided exercise(s) from a workout if they exist.
func (w Workout) RemoveExercises(exercises ...Exercise) {
	// TODO: Implement.
}

func NewExercise(name string) Exercise {
	return Exercise{
		ID:   uuid.New(),
		Name: name,
	}
}
