import 'package:flutter/material.dart';

class Homescreendashboard extends StatefulWidget {
  const Homescreendashboard({super.key});

  @override
  State<Homescreendashboard> createState() => _HomescreendashboardState();
}

class _HomescreendashboardState extends State<Homescreendashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(      
      decoration: BoxDecoration(color: Colors.amberAccent, shape: BoxShape.rectangle),
      padding: EdgeInsets.symmetric(vertical: 300, horizontal: 75),
      child: Text("Text")
    );
  }
}