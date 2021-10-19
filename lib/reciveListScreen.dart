import 'package:flutter/material.dart';
import 'package:flutter_application_1/recipe.dart';
import 'package:flutter_application_1/recipeScreen.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RecipeListScreenState();
  }
}

class RecipeListScreenState extends State<RecipeListScreen> {
  final List<Recipe> recipes = [
    Recipe(
        "Pizza facile",
        "Par David Silva",
        "images/emin.jpg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        86),
    Recipe(
        "Pizza facile",
        "Par David Silva",
        "images/koki.jpg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        86),
    Recipe(
        "Pizza facile",
        "Par David Silva",
        "images/emin.jpg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        86),
    Recipe(
        "Pizza facile",
        "Par David Silva",
        "images/koki.jpg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        86),
    Recipe(
        "Pizza facile",
        "Par David Silva",
        "images/emin.jpg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        86),
    Recipe(
        "Pizza facile",
        "Par David Silva",
        "images/koki.jpg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        86),
    Recipe(
        "Pizza facile",
        "Par David Silva",
        "images/emin.jpg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        86),
    Recipe(
        "Pizza facile",
        "Par David Silva",
        "images/koki.jpg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        86),
    Recipe(
        "Pizza facile",
        "Par David Silva",
        "images/emin.jpg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        86),
    Recipe(
        "Pizza facile",
        "Par David Silva",
        "images/koki.jpg",
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
        false,
        86),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Mes recettes",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return Dismissible(
                key: Key(recipe.title),
                onDismissed: (direction) {
                  setState(() {
                    recipes.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${recipe.title} supprimé!")));
                },
                background: Container(
                  color: Colors.orange,
                ),
                child: RecipeItemWidget(
                  recipe: recipe,
                ));
          },
        ));
  }
}

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({Key key, @required this.recipe}) : super(key: key);
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  RecipeScreen(recipe: recipe),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = Offset(0.0, 1.0);
                var end = Offset.zero;
                var tween = Tween(begin: begin, end: end);
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              }),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 7,
        child: Row(children: [
          Image.asset(recipe.imgUrl,
              height: 100, width: 100, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(recipe.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Text(recipe.user,
                    style: TextStyle(color: Colors.grey, fontSize: 16))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
