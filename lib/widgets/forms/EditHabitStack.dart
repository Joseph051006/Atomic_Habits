import 'package:flutter/material.dart';
import 'package:atomic_habits/core/models/habits.dart';
import 'package:atomic_habits/core/models/stackedHabit.dart';

import '../../core/globals.dart';

class EditHabitStack extends StatefulWidget {
  final Function(Stackedhabit) onSave;
  final int habitID;
  const EditHabitStack({
    required this.habitID,
    required this.onSave,
    super.key,
  });

  @override
  State<EditHabitStack> createState() => _EditHabitStackState();
}

class _EditHabitStackState extends State<EditHabitStack> {
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
    currentController.text = stackedHabits[widget.habitID].currentHabit;
    super.initState();
  }

  List<DropdownMenuItem<Habits>> _allHabits() {
    return habits
        .map((f) => DropdownMenuItem(value: f, child: Text(f.name)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: _stackForm(),
    );
  }

  Widget currentSelector() {
    return DropdownButtonFormField<Habits>(
      items: _allHabits(),
      onChanged: (v) => setState(() {
        _stackedHabit = v!;
      }),
    );
  }

  Widget _stackSave() {
    return ElevatedButton(onPressed: _submit, child: const Text("Save Stack"));
  }

  Widget _stackCurrent() {
    return TextFormField(
      controller: currentController,
      decoration: const InputDecoration(label: Text("Current Habit")),
      validator: (value) => value!.isEmpty ? "required" : null,
    );
  }

  Widget _stackForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [_stackCurrent(), currentSelector(), _stackSave()],
        ),
      ),
    );
  }
}
