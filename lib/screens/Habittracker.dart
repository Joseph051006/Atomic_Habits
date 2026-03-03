import 'package:flutter/material.dart';
import '../core/globals.dart' as habit;

class HabitTracker extends StatefulWidget {

  const HabitTracker({
    super.key,
    });
  
 
  @override
  State<HabitTracker> createState() => _HabitTrackerState();
 

}

class _HabitTrackerState extends State<HabitTracker> {
  
  

  void _addHabit(){
    setState(() {
       habit.habits.add(
        Card(
          child: ListTile(
            title: Text("Text")
          )
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.bottomCenter,
        children: [ 
          ListView.builder(
            itemCount: habit.habits.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("data"),
              );
              
            },
            
        ),
        FloatingActionButton(child: Icon(Icons.add), onPressed: () {
          return _addHabit();
        },)
        ]
    );
  }
}


