import 'package:atomic_habits/screens/HabitStacker.dart';
import 'package:atomic_habits/screens/TwoMinutes.dart';
import 'package:atomic_habits/widgets/Body/HomeScreenDashboard.dart';
import 'package:flutter/material.dart';
import '../widgets/AppBar/HomeScreenAppBar.dart';
import '../widgets/BottomNavBar/HomeScreenNavBar.dart';
import '../../core/globals.dart';
import '../widgets/Drawer/HomeScreenDrawer.dart';
import 'Habittracker.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<Widget> _pages = [
    Homescreendashboard(),
    Container(child: Text("Funktioniert super...")),
    HabitTracker(),
    Habitstacker(),
    Twominutes(),
    Container(child: Text("1% a Day")),
    Container(child: Text("")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppBar(),
      body: _pages[currentPageIndex],
      drawer: MenuDrawer(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index + 2;
          });
        },
        selectedIndex: currentPageIndex,
      ),
      bottomNavigationBar: Homescreennavbar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
