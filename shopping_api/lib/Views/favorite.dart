import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(
          Icons.favorite_rounded,
          size: 30,
          color: isFavorite ? Colors.grey : Colors.red,
        ),
        onPressed: () {
          setState(() {
            // Toggle the state when the icon is clicked
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Favorite Icon Example'),
      ),
      body: Center(
        child: FavoriteIcon(),
      ),
    ),
  ));
}
