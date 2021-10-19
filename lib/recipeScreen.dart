import 'package:flutter/material.dart';
import 'package:flutter_application_1/favoriteWidget.dart';
import 'package:flutter_application_1/recipe.dart';
import 'package:transparent_image/transparent_image.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({Key key, this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    Widget titlesection = Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(recipe.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  Text(
                    recipe.user,
                    style: TextStyle(color: Colors.grey[500], fontSize: 16),
                  ),
                ],
              ),
            ),
            FavoriteWidget(
                isFavorited: recipe.isFavorite,
                favoriteCount: recipe.favoriteCounter),
          ],
        ));

    Widget buttomsection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: _buildButtonColumn(Colors.red, Icons.comment, "COMMENT"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: _buildButtonColumn(Colors.red, Icons.share, "SHARE"),
        ),
      ],
    );
    Widget descriptionsection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        recipe.description,
        softWrap: true,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            "Mes recettes",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: 600,
                  height: 240,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: recipe.imgUrl,
                  width: 600,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            titlesection,
            buttomsection,
            descriptionsection
          ],
        ));
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Icon(
            icon,
            color: color,
            size: 30,
          ),
        ),
        Text(label,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: color)),
      ],
    );
  }
}
