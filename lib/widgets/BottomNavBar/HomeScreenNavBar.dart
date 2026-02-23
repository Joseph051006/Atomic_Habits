import 'package:flutter/material.dart';
import '../../core/globals.dart';

class Homescreennavbar extends StatefulWidget {

  final ValueChanged<int> onDestinationSelected;

  const Homescreennavbar({
    super.key,
    required this.onDestinationSelected
    
  });

  @override
  State<Homescreennavbar> createState() => _HomescreennavbarState();
}

class _HomescreennavbarState extends State<Homescreennavbar> {

  @override
  Widget build(BuildContext context) {
    return NavigationBar(destinations: destination(),
    onDestinationSelected: widget.onDestinationSelected
      
    );}
  }

List<Widget> destination(){
return [
    NavigationDestination(icon: Icon(Icons.menu), label: 'menu'),
    NavigationDestination(icon: Icon(Icons.home), label: 'home'),
    NavigationDestination(icon: Icon(Icons.settings), label: 'settings')
    ];
} 