import 'package:atomic_habits/core/models/habits.dart';

class Stackedhabit {
  final String currentHabit;
  final Habits stackedHabit;

  Stackedhabit({
    required this.currentHabit, 
    required this.stackedHabit
  });
}
