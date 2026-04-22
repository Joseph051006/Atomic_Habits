import 'package:flutter/material.dart';
import '../core/globals.dart';
import '../widgets/forms/AddHabitSheet.dart';
import '../widgets/forms/EditHabitSheet.dart';

class HabitTracker extends StatefulWidget {
  const HabitTracker({super.key});

  @override
  State<HabitTracker> createState() => _HabitTrackerState();
}

class _HabitTrackerState extends State<HabitTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Habit Tracker")),
      body: habits.isEmpty
          ? const Center(child: Text("No habits yet. Add one!"))
          : ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, index) {
                final habit = habits[index];
                return _createHabitCard(index, habit);
              },
            ),
      floatingActionButton: _habitCreate(context),
    );
  }

  Widget _createHabitCard(int index, habit) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      color: habit.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: habit.icon,
        title: Text(habit.name),
        subtitle: Text(habit.description),
        trailing: _habitCrud(index),
      ),
    );
  }

  Widget _habitCrud(int index) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        _habitEdit(index, context),
        _habitDelete(index),
      ],
    );
  }

  Widget _habitCreate(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _addHabitPopup(context),
      child: const Icon(Icons.add),
    );
  }

  PopupMenuItem _habitEdit(int index, BuildContext context) {
    return PopupMenuItem(
      onTap: () => _editHabitPopup(index, context),
      child: const Text("Edit"),
    );
  }

  PopupMenuItem _habitDelete(int index) {
    return PopupMenuItem(
      onTap: () => setState(() => habits.removeAt(index)),
      child: const Text("Delete"),
    );
  }

  void _editHabitPopup(int index, BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _callEditPopup(index),
    );
  }

  EditHabitSheet _callEditPopup(int index) {
    return EditHabitSheet(
      habitID: index,
      onSave: (editHabit) {
        setState(() => habits[index] = editHabit);
      },
    );
  }

  void _addHabitPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _callAddPopup(),
    );
  }

  AddHabitSheet _callAddPopup() {
    return AddHabitSheet(
      onSave: (newHabit) {
        setState(() => habits.add(newHabit));
      },
    );
  }
}