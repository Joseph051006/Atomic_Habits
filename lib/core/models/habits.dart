import 'package:flutter/material.dart';

class Habits {
  final int? id; // nullable for AUTOINCREMENT
  final String name;
  final String description;
  final Icon icon; // changed from Icon to IconData — Icon is a Widget, not storable
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
    this.id,
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

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'icon': icon,         // IconData -> int
        'color': color.value,               // Color -> int
        'frequency': frequency,
        'targetValue': targetValue,
        'unit': unit,
        'streak': streak,
        'level': level,
        'dateCreated': dateCreated,
        'history': history.join(','),       // List<String> -> comma-separated string
        'reminderTime': reminderTime,
        'isActive': isActive ? 1 : 0,       // bool -> int (SQLite has no bool)
      };

  factory Habits.fromMap(Map<String, dynamic> map) => Habits(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        icon: Icon(map['icon']),
        color: Color(map['color']),
        frequency: map['frequency'],
        targetValue: map['targetValue'],
        unit: map['unit'],
        streak: map['streak'],
        level: map['level'],
        dateCreated: map['dateCreated'],
        history: (map['history'] as String).split(','), // string -> List<String>
        reminderTime: map['reminderTime'],
        isActive: map['isActive'] == 1,
      );
}