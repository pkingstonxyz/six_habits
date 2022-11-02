import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:six_habits/models/day.dart';

class DatabaseService {
	//This is a Singleton class. In other words, it doesn't always return a new instance of the class
	DatabaseService._privateConstructor();
	static final DatabaseService instance = DatabaseService._privateConstructor(); 
	
	static Database? _database;
	Future<Database> get database async => _database ??= await _initDatabase(); 

	Future<Database> _initDatabase() async {
		Directory documentsDirectory = await getApplicationDocumentsDirectory();
		String path = join(documentsDirectory.path, "habits.db");
		return await openDatabase(
			path,
			version: 1,
			onCreate: _onCreate,
		);
	}

	Future _onCreate(Database db, int version) async {
		await db.execute(
			"""
			CREATE TABLE habits(
				day INTEGER PRIMARY KEY,
				habit1 BOOLEAN NOT NULL,
				habit2 BOOLEAN DEFAULT NULL,
				habit3 BOOLEAN DEFAULT NULL,
				habit4 BOOLEAN DEFAULT NULL,
				habit5 BOOLEAN DEFAULT NULL,
				habit6 BOOLEAN DEFAULT NULL
			)
			"""
		);
	}
	 
	void initializeHabits(
		habit1,
		habit2,
		habit3,
		habit4,
		habit5,
		habit6) {
		_database?.insert(
			"habits",
			{
				'day': 0,
				'habit1': habit1,
				'habit2': habit2 != "" ? habit2 : Null,
				'habit3': habit3 != "" ? habit3 : Null,
				'habit4': habit4 != "" ? habit4 : Null,
				'habit5': habit5 != "" ? habit5 : Null,
				'habit6': habit6 != "" ? habit6 : Null,
		});
	}

	Future<Day> getHabits() async {
		final query = await _database?.query("habits", where: "day == 0");
		final habitList = query?[0];
	}
}

final databaseProvider = Provider<DatabaseService>(
	(ref) => DatabaseService.instance
); 
