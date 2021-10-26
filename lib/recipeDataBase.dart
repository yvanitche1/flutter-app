import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/recipe.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecipeDataBase {
  RecipeDataBase._();

  static final RecipeDataBase instance = RecipeDataBase._();
  static Database _database;

  Future<Database> get database async {
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
          "CREATE TABLE recipe(title TEXT PRIMARY KEY, user TEXT, imgUrl TEXT, description TEXT, isFavorite INTEGER, favoriteCounter INTEGER)",
        );
      },
      version: 1,
    );
  }

  void insertRecipe(Recipe recipe) async {
    final Database db = await database;

    await db.insert(
      'recipe',
      recipe.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void updateRecipe(Recipe recipe) async {
    final Database db = await database;
    await db.update("recipe", recipe.toMap(),
        where: "title = ?", whereArgs: [recipe.title]);
  }

  void deleteRecipe(String title) async {
    final Database db = await database;
    db.delete("recipe", where: "title = ?", whereArgs: [title]);
  }

  Future<List<Recipe>> recipes() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('recipe');
    List<Recipe> recipes = List.generate(maps.length, (i) {
      return Recipe.fromMap(maps[i]);
    });

    if (recipes.isEmpty) {
      for (Recipe recipe in defaultRecipes) {
        insertRecipe(recipe);
      }
      recipes = defaultRecipes;
    }

    return recipes;
  }

  final List<Recipe> defaultRecipes = [
    Recipe(
        "Pizza facile",
        "Par David Silva",
        "https://assets.afcdn.com/recipe/20200206/107152_w768h583c1cx176cy267cxb353cyb535.webp",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        86),
    Recipe(
        "Burgger facile",
        "Par Djila Silva",
        "https://106fyz3cd4vi2lc2uq1tlyl4-wpengine.netdna-ssl.com/wp-content/uploads/2020/09/Moist-Chicken-Burgers.jpg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        88),
    Recipe(
        "Kfc facile",
        "Par Nguiemegni Silva",
        "https://www.kfc-suisse.ch/fileadmin/media/images/Produkte/Buckets/kfc_thumb_buckets_filet.png",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        8),
    Recipe(
        "MacDo facile",
        "Par Raye Silva",
        "https://bodyquick.es/wp-content/uploads/2016/09/cheat-meal.jpg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        36),
    Recipe(
        "Poulet facile",
        "Par Macdo Silva",
        "https://t1.uc.ltmcdn.com/fr/images/8/2/3/img_comment_faire_du_poulet_frit_6328_600.jpg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        35),
    Recipe(
        "Jus de fruit facile",
        "Par Edmond edward",
        "https://www.mesjusdefruits.fr/wp-content/uploads/2019/10/difference-pur-jus-et-concentre.jpg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        874),
    Recipe(
        "Coca facile",
        "Par Silver Ken",
        "https://st.depositphotos.com/1364913/1200/i/950/depositphotos_12004559-stock-photo-coca-cola-can-with-cola.jpg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        265),
    Recipe(
        "Porc facile",
        "Par Sandes Solven",
        "https://assets.afcdn.com/recipe/20141111/3746_w768h583c1cx429cy285.webp",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        886),
    Recipe(
        "Vin rouge facile",
        "Par Vincent Silvera",
        "https://www.levinaletrier.com/wp-content/uploads/2020/11/DANNOT.jpg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        45),
    Recipe(
        "Boeuf bourguignon",
        "Par Kolibri",
        "https://img.cuisineaz.com/660x660/2017/04/22/i125144-.jpeg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        6),
  ];
}
