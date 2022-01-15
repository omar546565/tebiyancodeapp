import 'package:flutter/material.dart';
import 'package:tebiyancode/bmi_screen.dart';


import 'counter_screen.dart';


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
        home:    BmiScreen()
      ) ;
    }
}