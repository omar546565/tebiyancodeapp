import 'package:flutter/material.dart';
import 'package:tebiyancode/modules/login/login_screen.dart';

import 'layout/home_layout.dart';
import 'modules/counter/counter_screen.dart';



void main() {
  runApp(const MyApp());

}

class MyApp  extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) 
    {
      // ignore: prefer_const_constructors
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:    counterScreen()
      ) ;
    }
}