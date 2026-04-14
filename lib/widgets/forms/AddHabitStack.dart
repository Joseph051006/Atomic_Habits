import 'package:flutter/material.dart';
import 'package:atomic_habits/core/models/habits.dart';
import 'package:atomic_habits/core/models/stackedHabit.dart';

import '../../core/globals.dart';

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

  List<DropdownMenuItem<Habits>> _allHabits() {
    return habits
        .map((f) => DropdownMenuItem(value: f, child: Text(f.name)))
        .toList();
  }

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
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: _habitForm()
    );
  }

  Widget _currentSelector() {
    return DropdownButtonFormField<Habits>(
      items: _allHabits(),
      onChanged: (v) => setState(() {
        _stackedHabit = v!;
      }),
    );
  }

  Widget _currentHabit() {
    return TextFormField(
      controller: currentController,
      decoration: const InputDecoration(label: Text("Current Habit")),
      validator: (value) => value!.isEmpty ? "required" : null,
    );
  }

  Widget _stackSave() {
    return ElevatedButton(onPressed: _submit, child: const Text("Save Stack"));
  }
  
  Widget _habitForm(){
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _currentHabit(),
            _currentSelector(),
            _stackSave(),
          ],
        ),
      ),
    );
  }
}
