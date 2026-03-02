import 'package:flutter/material.dart';

class HabitTracker extends StatefulWidget {
  const HabitTracker({super.key});

  @override
  State<HabitTracker> createState() => _HabitTrackerState();
}

class _HabitTrackerState extends State<HabitTracker> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Placeholder(),
        floatingActionButton: IconButton(icon: Icon(Icons.add), onPressed: () {
        print("53s5");
      },)
    ),
    );
  }
}

