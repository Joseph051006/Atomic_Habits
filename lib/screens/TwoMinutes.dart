
import 'dart:async';

import 'package:atomic_habits/core/models/habits.dart';
import 'package:flutter/material.dart';
import '../core/globals.dart';

class Twominutes extends StatefulWidget {
  const Twominutes({super.key});

  @override
  State<Twominutes> createState() => _TwominutesState();
}

class _TwominutesState extends State<Twominutes> {
  late Timer _timer;
  int _elapsedTime = 120;
  bool _isRunning = false;
  Habits? _selectedHabit;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer(){
    if (!_isRunning){
      _timer = Timer.periodic(Duration(seconds: 1), (timer) =>
        setState(() {
          _elapsedTime--;
          if(_elapsedTime <= 0){
            _stopTimer();
            _checked();
          } 
          
        })
      );
    }
    setState(() {
      _isRunning = true;
    });
  }

  void _stopTimer(){
    _timer.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer(){
    _timer.cancel();
    setState(() {
      _elapsedTime = 120;
      _isRunning = false;
    });
  }

  String _formatTime(){
    int minutes = _elapsedTime ~/ 60;
    int seconds = _elapsedTime % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';    
  }

  void _checked(){
    _selectedHabit!.color = Colors.green;
  
  }



  Widget _selectHabit(){
    return 
    DropdownButton(
      value: _selectedHabit,
    items: habits.map((f) => DropdownMenuItem(
      value: f, child: Text(f.name))).toList(), 
    onChanged: (v) => setState(() {
      _selectedHabit = v;
    })
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Center(
          child: Text(_formatTime(), style: TextStyle(fontSize: 100)),
        ),
        _selectHabit(),
        SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: _startTimer, child: Text("Start")),
            ElevatedButton(onPressed: _stopTimer, child: Text("Stop")),
            ElevatedButton(onPressed: _resetTimer, child: Text("Reset"))
          ],

        ), 
      ],
    );
  }
}