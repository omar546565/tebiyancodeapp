

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children:  [
          const Text(
            'login',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'email',
            ),
          ),
        ]),
      ),
    );
  }
}