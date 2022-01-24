import 'package:flutter/material.dart';

class BmiResultScreen  extends StatelessWidget
{
  final int result;
  final bool isMale;
  final int age;

  const BmiResultScreen({
  required this.result,
  required  this.isMale,
  required  this.age,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
            },
          icon: const Icon(
            Icons.keyboard_arrow_left
          ),
        ),
        title:  const Text(
          'BmiResultScreen',

        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender:${isMale ? 'male' : 'female'}',
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Result:$result',
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Age:$age',
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
