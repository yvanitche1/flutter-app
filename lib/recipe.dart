import 'package:flutter/cupertino.dart';

class Recipe {
  String title;
  String user;
  String imgUrl;
  String description;
  bool isFavorite;
  int favoriteCounter;

  Recipe(this.title, this.user, this.imgUrl, this.description, this.isFavorite,
      this.favoriteCounter);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'user': user,
      'imgUrl': imgUrl,
      'description': description,
      'isFavorite': isFavorite,
      'favoriteCounter': favoriteCounter,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) => new Recipe(
        map['title'],
        map['user'],
        map['imgUrl'],
        map['description'],
        map['isFavorite'] == 1,
        map['favoriteCounter'],
      );
}
