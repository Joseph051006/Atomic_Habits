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
      title: input(),
      subtitle: Text("Some description of the habit"),
      tileColor: Color.fromRGBO(255, 170, 0, 100),
      shape: RoundedRectangleBorder(side: BorderSide.none, borderRadius: BorderRadiusGeometry.circular(10)),
      trailing: PopupMenuButton(itemBuilder: (context) => [
        PopupMenuItem(child: Text("Edit")),
        PopupMenuItem(child: Text("Delete")),
        PopupMenuItem(child: Text("Gugus"))
      ]),
      isThreeLine: true,
    ));
  }
}

class Habits {
  String habit;
  int streak;
  
  Habits(this.habit, this.streak);

  Object create(BuildContext context){
    return {
      habit: input()
    };
  }
}

Widget input(){
  return TextFormField(
    decoration: InputDecoration(
      hintText: "Enter a Habit Name",
      labelText: "Habit",
      border: OutlineInputBorder()
    ),
    validator: (value) {
      if (value == null || value.isEmpty){
        return null;
      } 
      return value;
    }, onSaved: (newValue) {
      print("Saved: $newValue");
    },
  );
}