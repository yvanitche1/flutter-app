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
          Hero(
            tag: "imageRecipe" + recipe.title,
            child: Image.network(recipe.imgUrl,
                height: 100, width: 100, fit: BoxFit.cover),
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
