import 'package:flutter/material.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.brown,
      title: Container(
        child: Text("I am Atomic"),
      )
    );
  }
  @override
    Size get preferredSize => Size.fromHeight(kToolbarHeight);
}