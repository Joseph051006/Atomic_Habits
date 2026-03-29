
import 'dart:async';

import 'package:flutter/material.dart';

class Twominutes extends StatefulWidget {
  const Twominutes({super.key});

  @override
  State<Twominutes> createState() => _TwominutesState();
}

class _TwominutesState extends State<Twominutes> {
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Center(
          child: Text("Display time"),
        ),
        SizedBox(),
        Row(
          children: [
            ElevatedButton(onPressed: null, child: Text("Start")),
            SizedBox(),
            ElevatedButton(onPressed: null, child: Text("Stop")),
            ElevatedButton(onPressed: null, child: Text("Reset"))
          ],
        ), 
      ],
    );
  }
}