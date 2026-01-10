import 'package:flutter/material.dart';
import 'package:gym_buddy_mobile/types/workout.dart';

class ExpandedWorkoutTile extends StatefulWidget {
  const ExpandedWorkoutTile({super.key, required this.workout});
  final Workout workout;

  @override
  State<ExpandedWorkoutTile> createState() => _ExpandedWorkoutTileState();
}

class _ExpandedWorkoutTileState extends State<ExpandedWorkoutTile> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final height = screen.height;
    final isCompact = height < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FB),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            pinned: true,
            expandedHeight: height * 0.35,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: widget.workout.name,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    widget.workout.imageLink == ''
                        ? Image.asset(
                            'assets/app_title.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, _, __) =>
                                Container(color: Colors.grey[300]),
                          )
                        : Image.network(
                            widget.workout.imageLink,
                            fit: BoxFit.cover,
                            errorBuilder: (context, _, __) =>
                                Container(color: Colors.grey[300]),
                          ),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black54],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Content
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.workout.isFavourite =
                                !widget.workout.isFavourite;
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: widget.workout.isFavourite
                              ? Colors.redAccent
                              : Colors.blueGrey,
                          size: 30,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.workout.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isCompact ? 22 : 28,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () => {},
                        child: Text(
                          "Train",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              shadows: [
                                Shadow(
                                    color:
                                        const Color.fromARGB(255, 10, 52, 124),
                                    blurRadius: 5)
                              ]),
                        ),
                      )
                    ],
                  ),
                  Text(
                    widget.workout.targetMuscles.join(', '),
                    style: TextStyle(
                      fontSize: isCompact ? 15 : 17,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 10),

                  ...widget.workout.previewExercises.map(
                    (exercise) => Card(
                      margin: const EdgeInsets.only(bottom: 14),
                      elevation: 1.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exercise,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: isCompact ? 17 : 19,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Last session: 8 × 60 kg',
                              style: TextStyle(
                                fontSize: isCompact ? 14 : 15,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              'Today’s session: 6 × 70 kg',
                              style: TextStyle(
                                fontSize: isCompact ? 14 : 15,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
