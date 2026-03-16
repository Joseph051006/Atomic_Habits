import 'package:flutter/material.dart';
import '../core/globals.dart';
import '../widgets/AddHabitSheet.dart';

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
          // Empty state
          ? const Center(child: Text("No habits yet. Add one!"))
          // List of habits
          : ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, index) {
                final habit = habits[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  color: habit.color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: habit.icon,
                    title: Text(habit.name),
                    subtitle: Text(habit.description),
                    trailing: PopupMenuButton(
                      itemBuilder: (context) => [
                        const PopupMenuItem(child: Text("Edit")),
                        const PopupMenuItem(child: Text("Delete")),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => AddHabitSheet(
            onSave: (newHabit) {
              setState(() => habits.add(newHabit));
            },
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
