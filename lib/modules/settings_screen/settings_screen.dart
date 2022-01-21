import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'SettingsScreen',
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,

        ),

      ),
    );
  }
}
