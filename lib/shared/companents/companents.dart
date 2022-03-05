import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tebiyancode/shared/cubit/cubit.dart';

import '../../modules/news_app/web_view/web_view_screen.dart';

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
  height: 40.0,
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

Widget defaultTextButton({
  required Function() function,
  required String text,
})=>TextButton(
  onPressed:function,
  child: Text(text.toString(),
    style: TextStyle(
      fontSize: 18.0,
    ),
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

Widget buildTasksItem (Map model, context)=>Dismissible(
  key: Key(model['id'].toString()),
  child:   Padding(
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

        Expanded(

          child: Column(

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

        ),

        SizedBox(width: 20.0,),

        IconButton(

            onPressed: (){

                AppCubit.get(context).updateData(status: 'done', id:model['id'],);

            },

            icon: Icon(

              Icons.check_box,

              color: Colors.green,

            ),

        ),

        IconButton(

            onPressed: (){

              AppCubit.get(context).updateData(status: 'archive', id:model['id'],);

            },

            icon: Icon(

              Icons.archive,

              color: Colors.red,

            ),

        ),

      ],

    ),

  ),
  onDismissed:(direction) {
    AppCubit.get(context).deleteData(id: model['id'],);
  },
);

Widget defaultAppBar({
  required BuildContext context,
  String? title,
   List<Widget>?  actions,
})=>AppBar(
  leading: IconButton(
    icon: Icon(Icons.arrow_forward),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
  title: Text(title!,),
  actions: actions,
);

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color:Colors.grey[300],
  ),
);

Widget bulidArticleItem(article, context) => InkWell(
  onTap:(){
    navigateTo(context, WebViewScreen(article['url']),);
  } ,
  child:   Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        Container(
  
          height: 120.0,
  
          width: 120.0,
  
          decoration: BoxDecoration(
  
            borderRadius: BorderRadius.circular(10.0,),
  
            image: DecorationImage(
  
              image: NetworkImage('${article['center']}'),
  
              fit: BoxFit.cover,
  
            ),
  
          ),
  
        ),
  
        SizedBox(width: 20.0,),
  
        Expanded(
  
          child: Container(
  
            height: 120.0,
  
            child: Column(
  
              crossAxisAlignment: CrossAxisAlignment.start,
  
              mainAxisAlignment: MainAxisAlignment.start,
  
  
  
              children: [
  
                Expanded(
  
                  child: Text(
  
                    '${article['ring']}',
  
                    style: Theme.of(context).textTheme.bodyText1,
  
                    maxLines: 4,
  
                    overflow: TextOverflow.ellipsis,
  
                  ),
  
                ),
  
                Text(
  
                  '${article['datanews']}',
  
                  style: TextStyle(
  
                    color: Colors.grey,
  
                    fontSize: 18.0,
  
                    fontWeight: FontWeight.w600,
  
                  ),
  
                ),
  
              ],
  
            ),
  
          ),
  
        ),
  
  
  
  
  
      ],
  
    ),
  
  ),
);


void navigateTo(context,widget)=> Navigator.push
  (
  context,
  MaterialPageRoute(
    builder:(context)=> widget,
    ),
  );

void navigateAndFinish(context,widget)=> Navigator.pushAndRemoveUntil
  (
  context,
  MaterialPageRoute(
    builder:(context)=> widget,
    ),
        (Route<dynamic>route) {return false;} ,
  );

void showToast({

  required String text ,
  required ToastStates state ,

}) =>  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

//enum

enum ToastStates {
  SUCCESS,
  ERROR,
  WARNING
}

Color chooseToastColor(ToastStates state)
{
  Color color;
  switch(state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
      case ToastStates.ERROR:
        color = Colors.red;
      break;
      case ToastStates.WARNING:
        color = Colors.amber;
      break;

  }

  return color;
}