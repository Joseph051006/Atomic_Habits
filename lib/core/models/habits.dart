
import 'package:flutter/material.dart';

class Habits {
  final int id;
  final String name;
  final String description;
  final Icon icon;
  final Color color;

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
Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'icon': icon,
    'color': color,
    'frequency': frequency,
    'targetValue': targetValue,
    'unit': unit,
    'streak': streak,
    'level': level,
    'dateCreated': dateCreated,
    'history': history,
    'reminderTime': reminderTime,
    'isActive': isActive,
  };

  // Create a Habit object FROM a Map (JSON)
  factory Habits.fromJson(Map<String, dynamic> json) {
    return Habits(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      icon: json['icon'],
      color: json['color'],
      frequency: json['frequency'],
      targetValue: json['targetValue'],
      unit: json['unit'],
      streak: json['streak'] ?? 0,
      level: json['level'] ?? 0,
      dateCreated: DateTime.parse(json['dateCreated']).toString(),
      history: List<String>.from(json['history']),
      reminderTime: json['reminderTime'],
      isActive: json['isActive'] ?? true,
    );
  }



}





