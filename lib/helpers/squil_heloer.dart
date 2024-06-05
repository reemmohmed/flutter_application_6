// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:get_it/get_it.dart';

// class DatabaseHelper {
//   Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'your_database_name.db');

//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _createTables,
//     );
//   }

//   Future<void> _createTables(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE IF NOT EXISTS Categrase (
//         id INTEGER PRIMARY KEY,
//         name TEXT not null,
//         descraption text not null
//       )
//     ''');

//     await db.execute('''
//       CREATE TABLE IF NOT EXISTS prductes (
//         id INTEGER PRIMARY KEY,
//        name TEXT not null,
//         descraption text not null
//       )
//     ''');
//   }
// }

// GetIt locator = GetIt.instance;

// void setupLocator() {
//   locator.registerSingleton(DatabaseHelper());
// }

// void main() {
//   setupLocator();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     DatabaseHelper databaseHelper = locator<DatabaseHelper>();

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//         ),
//       ),
//     );
//   }
// }
