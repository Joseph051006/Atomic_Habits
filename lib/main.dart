import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'screens/Homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'habits.db' )
  )
  
  
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: Homescreen()),
  );
}
