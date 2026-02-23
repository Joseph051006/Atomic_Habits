import 'package:atomic_habits/widgets/Body/HomeScreenDashboard.dart';
import 'package:flutter/material.dart';
import '../widgets/AppBar/HomeScreenAppBar.dart';
import '../widgets/BottomNavBar/HomeScreenNavBar.dart';
import '../../core/globals.dart';
import 'test.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // 1. Define your pages in a list
  final List<Widget> _pages = [
    MyWidget(),
    Homescreendashboard(),
    Container( child: Text("Funktioniert super..."),)
    ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
     appBar: HomeScreenAppBar(),
     body: _pages[currentPageIndex],
     bottomNavigationBar: Homescreennavbar(onDestinationSelected: (int index) {
       setState(() {
         currentPageIndex = index;
       });
     },),
      )
    );
  }
}