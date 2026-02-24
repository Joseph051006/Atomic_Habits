import 'package:atomic_habits/widgets/Body/HomeScreenDashboard.dart';
import 'package:flutter/material.dart';
import '../widgets/AppBar/HomeScreenAppBar.dart';
import '../widgets/BottomNavBar/HomeScreenNavBar.dart';
import '../../core/globals.dart';
import 'menu.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // 1. Define your pages in a list
  final List<Widget> _pages = [
    
    Homescreendashboard(),
    Menu(),
    Container( 
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('lib/core/assets/images/neutral.png'))),
      child: Text("Funktioniert super...")
      )
    ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
     appBar: HomeScreenAppBar(),
     body: Center(
      child: _pages[currentPageIndex]
      ),
     bottomNavigationBar: Homescreennavbar(onDestinationSelected: (int index) {
       setState(() {
         currentPageIndex = index;
       });
     },),
      )
    );
  }
}