import 'dart:ffi';

import 'package:flutter/material.dart';

class Trackhabit extends StatefulWidget {
  const Trackhabit({super.key});

  @override
  State<Trackhabit> createState() => _TrackhabitState();
}

class _TrackhabitState extends State<Trackhabit> {
  @override
  Widget build(BuildContext context) {
    return
    Card(child: ListTile(
      title: Text("hello"),
      subtitle: Text("Some description of the habit"),
      tileColor: Color.fromRGBO(255, 170, 0, 100),
      shape: RoundedRectangleBorder(side: BorderSide.none, borderRadius: BorderRadiusGeometry.circular(10)),
      trailing: PopupMenuButton(itemBuilder: (context) => [
        PopupMenuItem(child: Text("Edit")),
        PopupMenuItem(child: Text("Delete")),
        PopupMenuItem(child: Text("Gugus"), onTap: () => {
          Habits("Sugus essen", 1).test(context)
        })
      ]),
      isThreeLine: true,
    ));
  }
}

class Habits {
  String habit;
  int streak;
  
  Habits(this.habit, this.streak);

  void test(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Your new habit is ' + ' $habit')));
  }

}