import 'dart:ffi';

import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
final ValueChanged<int> onDestinationSelected; 
final int selectedIndex;
  const MenuDrawer({
      super.key,
      required this.onDestinationSelected,
      required this.selectedIndex
    });
  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  late int _currentSelected;
  @override
  void initState() {// TODO: implement initState
    super.initState();
    _currentSelected = widget.selectedIndex;
  }
  @override
  
  

  Widget build(BuildContext context) {
    return NavigationDrawer( 
    selectedIndex:  _currentSelected,
         
    onDestinationSelected:(int index) {
      setState(() {
        _currentSelected = index;
      });
      widget.onDestinationSelected(index);
    },
    children: destination()
    );
  }
}

List<Widget> destination(){
  return [
    NavigationDrawerDestination(icon: Icon(Icons.track_changes), label: Text("Habit Tracker"),
    selectedIcon: Icon(Icons.track_changes_outlined), ),
    NavigationDrawerDestination(icon: Icon(Icons.stacked_bar_chart), label: Text("Habit Stacker")),
    NavigationDrawerDestination(icon: Icon(Icons.timelapse), label: Text("2 Minutes"))
  ];
}
