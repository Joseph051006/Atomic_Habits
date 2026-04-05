import 'package:atomic_habits/core/globals.dart';
import 'package:atomic_habits/widgets/AddHabitStack.dart';
import 'package:flutter/material.dart';

class Habitstacker extends StatefulWidget {
  const Habitstacker({super.key});

  @override
  State<Habitstacker> createState() => _HabitstackerState();
}

class _HabitstackerState extends State<Habitstacker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: stackedHabits.length,
        itemBuilder: (context, index) {
          final stackHabit = stackedHabits[index];
          return Card(
            child: ListTile(
              title: Text(
                "${stackHabit.currentHabit}"  + "${stackHabit.stackedHabit}",
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) => AddHabitStack(
            onSave: (newStack) {
              setState(() {
                stackedHabits.add(newStack);
              });
            },
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
