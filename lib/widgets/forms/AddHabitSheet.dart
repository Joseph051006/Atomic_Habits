import 'package:atomic_habits/core/models/habits.dart';
import 'package:flutter/material.dart';

class AddHabitSheet extends StatefulWidget {
  final Function(Habits) onSave;

  const AddHabitSheet({required this.onSave, super.key});

  @override
  State<AddHabitSheet> createState() => _AddHabitSheetState();
}

class _AddHabitSheetState extends State<AddHabitSheet> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final targetValueController = TextEditingController();
  final unitController = TextEditingController();

  Color selectedColor = Color.fromARGB(255, 255, 0, 0);
  Icon selectedIcon = Icon(Icons.star);
  String selectedFrequency = "Daily";
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isActive = true;

  @override
  void _dispose() {
    nameController.dispose();
    descriptionController.dispose();
    targetValueController.dispose();
    unitController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final habit = Habits(
        id: DateTime.now().hashCode,
        name: nameController.text,
        description: descriptionController.text,
        icon: selectedIcon,
        color: selectedColor,
        frequency: selectedFrequency,
        targetValue: int.parse(targetValueController.text),
        unit: unitController.text,
        dateCreated: DateTime.now().toString(),
        history: [],
        reminderTime: selectedTime.format(context),
        isActive: isActive,
      );
      widget.onSave(habit);
      Navigator.pop(context);
    }
  }

  List<DropdownMenuItem<String>> _habitFrequencyItems() {
    return [
      "Daily",
      "Weekly",
      "Monthly",
    ].map((f) => DropdownMenuItem(value: f, child: Text(f))).toList();
  }

  void _timeUI() async {
    final t = await showTimePicker(context: context, initialTime: selectedTime);
    if (t != null) setState(() => selectedTime = t);
    throw Exception("Time error");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _habitName(nameController),
              _habitDescription(descriptionController),
              _habitFrequency(selectedFrequency),
              _habitTargetValue(targetValueController),
              _habitUnit(unitController),
              _habitSelectedTime(selectedTime),
              _habitIsActive(isActive),
              _habitSave(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _habitName(TextEditingController nameController) {
    return TextFormField(
      controller: nameController,
      decoration: const InputDecoration(label: Text("Habit")),
      validator: (value) => value!.isEmpty ? "required" : null,
    );
  }

  Widget _habitDescription(TextEditingController descriptionController) {
    return TextFormField(
      controller: descriptionController,
      decoration: InputDecoration(label: Text("Habit Description")),
      maxLines: 3,
    );
  }

  Widget _habitTargetValue(TextEditingController targetValueController) {
    return TextFormField(
      controller: targetValueController,
      decoration: const InputDecoration(labelText: "Target Value"),
      keyboardType: TextInputType.number,
      validator: (v) => v!.isEmpty ? "Required" : null,
    );
  }

  Widget _habitUnit(TextEditingController unitController) {
    return TextFormField(
      controller: unitController,
      decoration: const InputDecoration(labelText: "Unit (e.g. km, glasses)"),
    );
  }

  Widget _habitFrequency(String selectedFrequency) {
    return DropdownButtonFormField<String>(
      initialValue: selectedFrequency,
      items: _habitFrequencyItems(),
      onChanged: (v) => setState(() {
        selectedFrequency = v!;
      }),
      decoration: InputDecoration(label: Text("Frequency input")),
    );
  }

  Widget _habitSelectedTime(TimeOfDay selectedTime) {
    return ListTile(
      title: Text("Reminder: ${selectedTime.format(context)}"),
      trailing: const Icon(Icons.access_time),
      onTap: _timeUI,
    );
  }

  Widget _habitIsActive(bool isActive) {
    return SwitchListTile(
      title: const Text("Active"),
      value: isActive,
      onChanged: (v) => setState(() => isActive = v),
    );
  }

  Widget _habitSave() {
    return ElevatedButton(onPressed: _submit, child: const Text("Save Habit"));
  }
}
