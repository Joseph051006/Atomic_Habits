import 'package:flutter/material.dart';
import '../widgets/AppBar/HomeScreenAppBar.dart';
class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        appBar: HomeScreenAppBar(),
        body: null,
        bottomNavigationBar:null,
      ),
    );
  }
}