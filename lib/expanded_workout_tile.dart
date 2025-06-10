import 'package:flutter/material.dart';
import 'package:gym_buddy_mobile/types/workout.dart';

class ExpandedWorkoutTile extends StatefulWidget {
  ExpandedWorkoutTile({required this.workout});
  final Workout workout;

  @override
  State<ExpandedWorkoutTile> createState() => _ExpandedWorkoutTileState();
}

class _ExpandedWorkoutTileState extends State<ExpandedWorkoutTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                widget.workout.imageLink ??
                    'https://www.creativefabrica.com/wp-content/uploads/2019/10/01/Bench-press-barbell-gym-workout-icon-by-Hoeda80-580x386.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 20,
          padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.workout.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => {
                  setState(() {
                    widget.workout.isFavourite = !widget.workout.isFavourite;
                  })
                },
                icon: Icon(
                  Icons.favorite,
                  size: 35,
                  color: widget.workout.isFavourite
                      ? Colors.redAccent
                      : Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
        Column(children: [
          Row(
            spacing: 20,
            children: [
              Padding(padding: EdgeInsets.only(left: 3)),
              Text(
                'Muscles worked:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                widget.workout.targetMuscles.join(', '),
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          for (var ex in widget.workout.previewExercises)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  Text(
                    ex,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  // Placeholders - exercises will eventually hold their own data:
                  Text('Last session: 8 x 60kg'),
                  Text('Today\'s session: 6 x 70kg'),
                ],
              ),
            )
        ])
      ],
    );
  }
}
