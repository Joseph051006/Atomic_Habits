
import 'package:flutter/material.dart';
import 'package:atomic_habits/core/models/habits.dart';
import 'package:atomic_habits/core/models/stackedHabit.dart';

import '../core/globals.dart';

class AddHabitStack extends StatefulWidget {
  final Function(Stackedhabit) onSave;
  const AddHabitStack({required this.onSave, super.key});

  @override
  State<AddHabitStack> createState() => _AddHabitStackState();
}

class _AddHabitStackState extends State<AddHabitStack> {
  late Habits _stackedHabit;

  final _formKey = GlobalKey<FormState>();
  final currentController = TextEditingController();

  void _dispose() {
    currentController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final stackedHabit = Stackedhabit(
        currentHabit: currentController.text,
        stackedHabit: _stackedHabit,
      );
      widget.onSave(stackedHabit);
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    currentController.text = "Your current Habit";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: currentController,
              decoration: const InputDecoration(label: Text("Current Habit")),
              validator: (value) => value!.isEmpty ? "required" : null,
            ),
            currentSelector(),
            ElevatedButton(onPressed: _submit, 
            child: const Text("Save Stack"))
          ],
        ),
      ),
    );
  }

  Widget currentSelector() {
    return DropdownButtonFormField<Habits>(
      items: habits
          .map((f) => DropdownMenuItem(value: f, child: Text(f.name)))
          .toList(),
      onChanged: (v) => setState(() {
        _stackedHabit = v!;
      }),
    );
  }
}
