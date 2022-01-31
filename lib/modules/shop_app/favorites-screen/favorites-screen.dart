import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'FavoritesScreen',
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,

        ),

      ),
    );
  }
}
