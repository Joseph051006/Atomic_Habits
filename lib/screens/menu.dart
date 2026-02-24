import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  final List<Widget> _pages = [
  
  ];


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [

        ],
      ),
    );
  }
}

Widget option(String title, String destanation){
  return Container(
    child: Text(title),
  
    );

}



Widget _toDestanation(String destanation){
  return Container(
    child: Text("d"),
  );
}
