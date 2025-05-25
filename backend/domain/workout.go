package workout

import (
	"fmt"
	"reflect"
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
	ExerciseId    string
	Name          string
	GifUrl        string
	Instructions  []string
	TargetMuscles []Muscle
	Equipments    []string
	Favourite     bool
}

type Muscle string

const (
	Chest      Muscle = "Chest"
	Back       Muscle = "Back"
	Shoulders  Muscle = "Shoulders"
	Triceps    Muscle = "Triceps"
	Biceps     Muscle = "Biceps"
	Quadriceps Muscle = "Quadriceps"
	Calves     Muscle = "Calves"
	Hamstrings Muscle = "Hamstrings"
	Glutes     Muscle = "Glutes"
)

func NewWorkout(name string, exercises []Exercise, isFavourite bool) Workout {
	return Workout{
		ID:          uuid.New(),
		Name:        name,
		Exercises:   exercises,
		CreatedDate: time.Now(),
		Favourite:   isFavourite,
	}
}

// AddExercises adds the provided exercise(s) to a workout if they do not already exist.
func (w Workout) AddExercises(newExercises ...Exercise) error {
	for _, newEx := range newExercises {
		for _, ex := range w.Exercises {
			if newEx.Name == ex.Name {
				return fmt.Errorf("%s already includes %s", w.Name, newEx.Name)
			}
		}
		w.Exercises = append(w.Exercises, newEx)
	}
	return nil
}

// RemoveExercises removes the provided exercise(s) from a workout if they exist.
func (w Workout) RemoveExercises(exsToRemove ...Exercise) error {
	var editedExs []Exercise

	for _, etr := range exsToRemove {
		for _, e := range w.Exercises {
			if etr.Name != e.Name {
				editedExs = append(editedExs, e)
			}
		}
	}
	if reflect.DeepEqual(w.Exercises, editedExs) {
		return fmt.Errorf("%s does not contain any of the listed exercises", w.Name)
	}
	w.Exercises = editedExs
	return nil
}

func NewExercise(id, name string, equips, instructions []string, targets []Muscle, isFavourite bool) Exercise {
	return Exercise{
		ExerciseId:    id,
		Name:          name,
		TargetMuscles: targets,
		GifUrl:        "",
		Instructions:  instructions,
		Equipments:    equips,
		Favourite:     isFavourite,
	}
}
