import 'package:flutter/material.dart';
import 'package:flutter_application_1/recipe.dart';
import 'package:flutter_application_1/reciveListScreen.dart';
import 'recipeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Widget titlesection = Container(
    //     padding: const EdgeInsets.all(20),
    //     child: Row(
    //       children: [
    //         Expanded(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Container(
    //                 padding: const EdgeInsets.only(bottom: 8),
    //                 child: Text("Pizza facile",
    //                     style: TextStyle(
    //                         fontWeight: FontWeight.bold, fontSize: 20)),
    //               ),
    //               Text(
    //                 "Par David Silva",
    //                 style: TextStyle(color: Colors.grey[500], fontSize: 16),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Icon(
    //           Icons.favorite,
    //           color: Colors.red,
    //           size: 30,
    //         ),
    //         Text(
    //           "55",
    //           style: TextStyle(fontSize: 15),
    //         ),
    //       ],
    //     ));

    // Widget buttomsection = Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children: [
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       child: _buildButtonColumn(Colors.red, Icons.comment, "COMMENT"),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       child: _buildButtonColumn(Colors.red, Icons.share, "SHARE"),
    //     ),
    //   ],
    // );
    // Widget descriptionsection = Container(
    //   padding: const EdgeInsets.all(32),
    //   child: Text(
    //     "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam! Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam! Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam! Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam! Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam! Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit corporis, corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!corrupti, aperiam, modi sit ullam ab labore eos dolore hic error deserunt? Laudantium dolore quam eum voluptates est animi laboriosam!",
    //     softWrap: true,
    //     style: TextStyle(
    //       fontSize: 20,
    //     ),
    //   ),
    // );

    return MaterialApp(
      title: 'Easy Food',
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      // home: RecipeListScreen(),
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => RecipeListScreen());
      case '/recipe':
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                RecipeScreen(recipe: settings.arguments),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation =
                  CurvedAnimation(curve: Curves.ease, parent: animation);
              return FadeTransition(
                opacity: animation,
                child: child,
              );
              // var begin = Offset(1.1, 1.1);
              // var end = Offset.zero;
              // var curve = Curves.ease;
              // var tween = Tween(begin: begin, end: end)
              //     .chain(CurveTween(curve: curve));
              // return SlideTransition(
              //   position: animation.drive(tween),
              //   child: child,
              // );
            });
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(title: Text("Error"), centerTitle: true),
                  body: Center(child: Text("Page found")),
                ));
    }
  }
}
