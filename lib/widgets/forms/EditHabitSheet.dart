import 'package:atomic_habits/core/models/habits.dart';
import 'package:flutter/material.dart';
import '../../core/globals.dart';

class EditHabitSheet extends StatefulWidget {
  final int habitID;
  final Function(Habits) onSave;

  const EditHabitSheet({
    required this.habitID,
    required this.onSave,
    super.key,
  });

  @override
  State<EditHabitSheet> createState() => _EditHabitSheetState();
}

class _EditHabitSheetState extends State<EditHabitSheet> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final targetValueController = TextEditingController();
  final unitController = TextEditingController();

  Color selectedColor = Colors.blue;
  Icon selectedIcon = const Icon(Icons.star);
  String selectedFrequency = "Daily";
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isActive = true;

  final List<DropdownMenuItem<String>> _habitFrequency = [
    "Daily",
    "Weekly",
    "Monthly",
  ].map((f) => DropdownMenuItem(value: f, child: Text(f))).toList();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with habit data
    nameController.text = habits[widget.habitID].name;
    descriptionController.text = habits[widget.habitID].description;
    targetValueController.text = habits[widget.habitID].targetValue.toString();
    unitController.text = habits[widget.habitID].unit;
    selectedFrequency = habits[widget.habitID].frequency;
    selectedTime = parseTime(habits[widget.habitID].reminderTime);
    isActive = habits[widget.habitID].isActive;
  }

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

  TimeOfDay parseTime(String time) {
    final parts = time.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  void _timeUI() async {
    final t = await showTimePicker(
      context: context,
      initialTime: parseTime(habits[widget.habitID].reminderTime),
    );
    if (t != null) setState(() => selectedTime = t);
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
      child: _editForm(),
    );
  }

  Widget _editName() {
    return TextFormField(
      controller: nameController,
      decoration: const InputDecoration(label: Text("Habit")),
      validator: (value) => value!.isEmpty ? "required" : null,
    );
  }

  Widget _editDescription() {
    return TextFormField(
      controller: descriptionController,
      decoration: InputDecoration(label: Text("Habit Description")),
      maxLines: 3,
    );
  }

  Widget _editFrequency() {
    return DropdownButtonFormField<String>(
      items: _habitFrequency,
      onChanged: (v) => setState(() {
        selectedFrequency = v!;
      }),
      decoration: InputDecoration(label: Text("Frequency input")),
    );
  }

  Widget _editTargetValue() {
    return TextFormField(
      controller: targetValueController,
      decoration: const InputDecoration(labelText: "Target Value"),
      keyboardType: TextInputType.number,
      validator: (v) => v!.isEmpty ? "Required" : null,
    );
  }

  Widget _editUnit() {
    return TextFormField(
      controller: unitController,
      decoration: const InputDecoration(labelText: "Unit (e.g. km, glasses)"),
    );
  }

  Widget _editSelectedTime() {
    return ListTile(
      title: Text("Reminder: ${selectedTime.format(context)}"),
      trailing: const Icon(Icons.access_time),
      onTap: _timeUI,
    );
  }

  Widget _editActive() {
    return SwitchListTile(
      title: const Text("Active"),
      value: isActive,
      onChanged: (v) => setState(() => isActive = v),
    );
  }

  Widget _editSave() {
    return ElevatedButton(onPressed: _submit, child: const Text("Save Habit"));
  }

  Widget _editForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _editName(),
            _editDescription(),
            _editFrequency(),
            _editTargetValue(),
            _editUnit(),
            _editSelectedTime(),
            _editActive(),
            _editSave(),
          ],
        ),
      ),
    );
  }
}
