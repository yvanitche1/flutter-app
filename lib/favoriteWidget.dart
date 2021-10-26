import 'package:flutter/material.dart';

class FavoriteIconWidget extends StatefulWidget {
  _FavoriteIconWidgetState createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  bool _isFavorite;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
      } else {
        _isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
      color: Colors.red,
      iconSize: 30,
      onPressed: _toggleFavorite,
    );
  }
}

class FavoriteTextWidget extends StatefulWidget {
  _FavoriteTextWidgetState createState() => _FavoriteTextWidgetState();
}

class _FavoriteTextWidgetState extends State<FavoriteTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "$_favoriteCount",
      style: TextStyle(fontSize: 15),
    );
  }
}
