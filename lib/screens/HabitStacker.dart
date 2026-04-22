import 'package:atomic_habits/core/globals.dart';
import 'package:atomic_habits/widgets/forms/AddHabitStack.dart';
import 'package:atomic_habits/widgets/forms/EditHabitStack.dart';
import 'package:flutter/material.dart';

class Habitstacker extends StatefulWidget {
  const Habitstacker({super.key});

  @override
  State<Habitstacker> createState() => _HabitstackerState();
}

class _HabitstackerState extends State<Habitstacker> {
  //TODO : REFACTOR
  //Refactor the entire code into multiple Widgets and functions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: stackedHabits.length,
        itemBuilder: (context, index) {
          final stackHabit = stackedHabits[index];
          return _createStackCard(index, stackHabit);
        },
      ),
      floatingActionButton: _stackCreate(context),
    );
  }

  Widget _habitCrud(int index) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        _stackEdit(index, context),
        _stackDelete(index),
      ],
    );
  }

  Widget _stackCreate(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _addStackPopup(context),
      child: const Icon(Icons.add),
    );
  }

  Widget _createStackCard(index, stackHabit){
    return Card(
            child: ListTile(
              title: Text(
                "After ${stackHabit.currentHabit}, i will do ${stackHabit.stackedHabit.name}",
              ),
              trailing: _habitCrud(index),
            ),
          );
  }

  PopupMenuItem _stackDelete(int index) {
    return PopupMenuItem(
      child: Text("Delete"),
      onTap: () => setState(() {
        stackedHabits.removeAt(index);
      }),
    );
  }

  PopupMenuItem _stackEdit(int index, BuildContext context) {
    return PopupMenuItem(
      onTap: () => _editStackPopup(index, context),
      child: Text("Edit"),
    );
  }

  dynamic _editStackPopup(int index, BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => _callEditPopup(index),
    );
  }

  EditHabitStack _callEditPopup(int index) {
    return EditHabitStack(
      habitID: index,
      onSave: (editStack) {
        setState(() => stackedHabits[index] = editStack);
      },
    );
  }

  dynamic _addStackPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => _callAddPopup(),
    );
  }

  AddHabitStack _callAddPopup() {
    return AddHabitStack(
      onSave: (newStack) {
        setState(() {
          stackedHabits.add(newStack);
        });
      },
    );
  }
}
