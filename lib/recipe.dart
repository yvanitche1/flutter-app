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
}
