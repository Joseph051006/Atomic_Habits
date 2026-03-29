
import 'dart:async';

import 'package:flutter/material.dart';

class Twominutes extends StatefulWidget {
  const Twominutes({super.key});

  @override
  State<Twominutes> createState() => _TwominutesState();
}

class _TwominutesState extends State<Twominutes> {
  late Timer _timer;
  int _elapsedTime = 0;
  bool _isRunning = false;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer(){
    if (!_isRunning){
      _timer = Timer.periodic(Duration(seconds: 1), (timer) =>
        setState(() {
          _elapsedTime++;
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
      _elapsedTime = 0;
      _isRunning = false;
    });
  }

  String _formatTime(){
    int minutes = _elapsedTime ~/ 60;
    int seconds = _elapsedTime % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';    
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Center(
          child: Text(_formatTime()),
        ),
        SizedBox(),
        Row(
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