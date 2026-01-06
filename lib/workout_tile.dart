import 'package:flutter/material.dart';
import 'package:gym_buddy_mobile/types/workout.dart';

class WorkoutTile extends StatefulWidget {
  const WorkoutTile({super.key, required this.workout});
  final Workout workout;

  @override
  State<WorkoutTile> createState() => _WorkoutTileState();
}

class _WorkoutTileState extends State<WorkoutTile> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width - 20;
    final height = screen.height / 3.75;

    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(color: Colors.black12, width: 0.6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.network(
              widget.workout.imageLink ??
                  'https://www.creativefabrica.com/wp-content/uploads/2019/10/01/Bench-press-barbell-gym-workout-icon-by-Hoeda80-580x386.jpg',
              height: height * 0.55,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, _, __) =>
                  Container(color: Colors.grey[300]),
            ),
          ),

          // --- Text and favourite icon ---
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 6, 10, 6),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final availableW = constraints.maxWidth;
                  final availableH = constraints.maxHeight;

                  // Responsive thresholds
                  final isCompact = availableH < 70 || availableW < 250;
                  final isVeryCompact = availableH < 55 || availableW < 200;

                  final titleSize =
                      (availableW / 18).clamp(16.0, 25.0).toDouble();
                  final detailSize =
                      (availableW / 28).clamp(14.0, 20.0).toDouble();

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.workout.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: titleSize,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            if (!isVeryCompact &&
                                widget.workout.previewExercises.isNotEmpty)
                              Text(
                                widget.workout.previewExercises.join(', '),
                                style: TextStyle(fontSize: detailSize),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            if (!isCompact &&
                                widget.workout.targetMuscles.isNotEmpty)
                              Text(
                                widget.workout.targetMuscles.join(', '),
                                style: TextStyle(fontSize: detailSize),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                          ],
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.only(top: 30),
                        visualDensity: VisualDensity.compact,
                        splashRadius: 18,
                        onPressed: () {
                          setState(() {
                            widget.workout.isFavourite =
                                !widget.workout.isFavourite;
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 30,
                          color: widget.workout.isFavourite
                              ? Colors.redAccent
                              : Colors.blueGrey,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
