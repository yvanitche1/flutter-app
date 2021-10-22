import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class RecipeDataBase {
  RecipeDataBase._();

  static final RecipeDataBase instance = RecipeDataBase._();
  static Database _database;

  Future<Database> get Database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
      join(await getDatabasesPath(), 'recipe_database.db'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE recipe(title TEXT PRIMARY KEY, user TEXT, imgURL TEXT, description TEXT, isFavorite INTEGER, favoriteCount INTEGER");
      },
      version: 1,
    );
  }
}
