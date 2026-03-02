import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
final ValueChanged<int> onDestinationSelected; 
const MenuDrawer({
      super.key,
      required this.onDestinationSelected
    });
  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
    onDestinationSelected: widget.onDestinationSelected,
    children: destination()
    );
  }
}

List<Widget> destination(){
  return [
    NavigationDrawerDestination(icon: Icon(Icons.track_changes), label: Text("Habit Tracker")),
    NavigationDrawerDestination(icon: Icon(Icons.stacked_bar_chart), label: Text("Habit Stacker")),
    NavigationDrawerDestination(icon: Icon(Icons.timelapse), label: Text("2 Minutes"))
  ];
}
