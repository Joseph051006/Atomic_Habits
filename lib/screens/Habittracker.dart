import 'package:flutter/material.dart';
import '../core/globals.dart';
import '../widgets/TrackHabit.dart';

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
       habits.add(
        Trackhabit()
      );
    });
}
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.bottomCenter,
        children: [ 
          ListView.builder(
            itemCount: habits.length,
            itemBuilder: (BuildContext context, int index) {
              return Trackhabit();
              
            },
            
        ),
        FloatingActionButton(child: Icon(Icons.add), onPressed: () {
          return _addHabit();
        },)
        ]
    );
  }



}