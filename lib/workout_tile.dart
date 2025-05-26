import 'package:flutter/material.dart';

class WorkoutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final workoutName = "Ben's Push Day";
    final previewExercises = ["Bench press", "Pec Deck"];
    final muscles = ["Chest", "Shoulders", "Triceps"];

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
                  'https://cdn.shopify.com/s/files/1/1127/3530/files/bench-mistakes-01.png?v=1492845884',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 20,
            padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workoutName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(previewExercises.join(', ')),
                Text(muscles.join(', ')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
