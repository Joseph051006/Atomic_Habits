import 'package:flutter/material.dart';

class Homescreennavbar extends StatefulWidget {

  final ValueChanged<int> onDestinationSelected;
  final int selectedIndex;
  const Homescreennavbar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected
    
  });

  @override
  State<Homescreennavbar> createState() => _HomescreennavbarState();
}

class _HomescreennavbarState extends State<Homescreennavbar> {
late int _currentSelected;
  @override
  void initState() {
    super.initState();
   _currentSelected = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
    selectedIndex: _currentSelected,  
    destinations: destination(),
    onDestinationSelected:(int index) {
      setState(() {
        _currentSelected = index;
      });
      widget.onDestinationSelected(index);
    },
    );
    }
  }

List<Widget> destination(){
return [
    NavigationDestination(icon: Icon(Icons.home), label: 'home'),
    NavigationDestination(icon: Icon(Icons.settings), label: 'settings')
    ];
} 