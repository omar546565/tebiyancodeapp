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

Widget defaultFormField(
    {
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  required String? Function(dynamic value) validate,
  Function(String value)? onFieldSubmit,
  Function(String value)? onChange,

  bool isPassword = false,
  bool isClickable = true,
  IconData? suffix,
  Function()? suffixPressed,
  Function()? onTap,

})=>TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  validator:validate,
  enabled:isClickable,

  decoration:  InputDecoration(
    labelText: label,
    suffixIcon:suffix != null ? IconButton(
      icon: Icon(
        suffix,
      ),
      onPressed: suffixPressed,
    ): null,

    border: OutlineInputBorder(),
  ),
  onFieldSubmitted: onFieldSubmit,
  onChanged: onChange,
    onTap :onTap,

);

Widget buildTasksItem (Map model)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 40.0,
        child: Text(
            '${model['time']}'
        ),
      ),
      SizedBox(width: 20.0,),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${model['title']}',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${model['data']}',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ],
  ),
);
