import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 10.0 ,
  double fontsize = 20.0 ,
 required Function() function,
 required String text,
}) => Container(
  width: width,

  child: MaterialButton(
    onPressed: function,
    child:  Text(
      isUpperCase ?  text.toUpperCase() : text ,
      style:  TextStyle(
        color: Colors.white,
        fontSize: fontsize,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius:BorderRadius.circular(
      radius,
    ),
    color: background,
  ),
);

