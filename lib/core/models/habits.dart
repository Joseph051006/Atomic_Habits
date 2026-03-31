
import 'package:flutter/material.dart';

class Habits {
  final int id;
  final String name;
  final String description;
  final Icon icon;
  Color color;
  final String frequency;
  final int targetValue;
  final String unit;
  final int streak;
  final int level;
  final String dateCreated;
  final List<String> history;
  final String reminderTime;
  final bool isActive;
Habits({
  required this.id,
  required this.name,
  required this.description,
  required this.icon,
  required this.color,
  required this.frequency,
  required this.targetValue,
  required this.unit,
  this.streak = 0,
  this.level = 0,
  required this.dateCreated,
  required this.history,
  required this.reminderTime,
  this.isActive = true,
});
}





