import 'package:flutter/material.dart';
import 'package:flutter_application_1/recipe.dart';
import 'package:flutter_application_1/recipeDataBase.dart';
import 'package:flutter_application_1/recipeScreen.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:provider/provider.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RecipeListScreenState();
  }
}

class RecipeListScreenState extends State<RecipeListScreen> {
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
      body: FutureBuilder<List<Recipe>>(
          future: RecipeDataBase.instance.recipes(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
            if (snapshot.hasData) {
              List<Recipe> recipes = snapshot.data;
              return ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return Dismissible(
                      key: Key(recipe.title),
                      onDismissed: (direction) {
                        setState(() {
                          recipes.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("${recipe.title} supprimé!")));
                      },
                      background: Container(
                        color: Colors.orange,
                      ),
                      child: RecipeItemWidget(
                        recipe: recipe,
                      ));
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({Key key, @required this.recipe}) : super(key: key);
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/recipe',
          arguments: recipe,
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 7,
        child: Row(children: [
          // CacheNetworkImage(imageUrl:recipe.imgUrl, Placeholder:(context, url)=> Center(child: CircularProgressIndicator()),
          // ErrorWidget: (context, url, error)=> Icon(Icons.error),width),
          Stack(
            children: [
              Container(
                  width: 100,
                  height: 100,
                  child: Container(
                    padding: const EdgeInsets.all(35),
                    child: CircularProgressIndicator(),
                  )),
              Hero(
                tag: "imageRecipe" + recipe.title,
                // child: Image.network(recipe.imgUrl,
                //     height: 100, width: 100, fit: BoxFit.cover),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: recipe.imgUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
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
