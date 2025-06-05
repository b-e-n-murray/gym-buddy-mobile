import 'package:flutter/material.dart';

class WorkoutTile extends StatefulWidget {
  // TODO: Fix immutability problem
  WorkoutTile({
    required this.workoutName,
    required this.previewExercises,
    required this.targetMuscles,
    required this.isFavourite,
    this.imageLink,
  });
  final String workoutName;
  final List<String> previewExercises;
  final List<String> targetMuscles;
  final String? imageLink;
  bool isFavourite;

  @override
  State<WorkoutTile> createState() => _WorkoutTileState();
}

class _WorkoutTileState extends State<WorkoutTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.5),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2),
          )
        ],
      ),
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height /
          3.195, // TODO: May need to revist.
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 0.5,
                  offset: Offset(0, 1),
                ),
              ],
              image: DecorationImage(
                image: NetworkImage(
                  widget.imageLink ??
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
                        widget.workoutName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(widget.previewExercises.join(', ')),
                      Text(widget.targetMuscles.join(', ')),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => {
                    setState(() {
                      widget.isFavourite = !widget.isFavourite;
                    })
                  },
                  icon: Icon(
                    Icons.favorite,
                    size: 28,
                    color:
                        widget.isFavourite ? Colors.redAccent : Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
