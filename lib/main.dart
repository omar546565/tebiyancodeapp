import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tebiyancode/modules/login/login_screen.dart';
import 'package:tebiyancode/shared/bloc_observer.dart';
import 'package:tebiyancode/shared/network/remote/dio_helper.dart';

import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'layout/todo-app/todo_layout.dart';
import 'modules/counter/counter_screen.dart';
import 'modules/counter/cubit/cubit.dart';
import 'shared/cubit/cubit.dart';



void main() {
  BlocOverrides.runZoned(
        () {
      // Use cubits...
          NewsCubit();
    },
    blocObserver: MyBlocObserver(),
  );

  DioHelper.init();

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
        theme: ThemeData(
          scaffoldBackgroundColor:Colors.white ,
          appBarTheme: AppBarTheme(
            backwardsCompatibility:false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange,
          ) ,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
            elevation: 50.0,
            backgroundColor: Colors.white,
          ) ,
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
         darkTheme: ThemeData(
           scaffoldBackgroundColor:HexColor('333739') ,
           appBarTheme: AppBarTheme(
             backwardsCompatibility:false,
             systemOverlayStyle: SystemUiOverlayStyle(
               statusBarColor: Colors.white,
               statusBarIconBrightness: Brightness.dark,
             ),
             backgroundColor: HexColor('333739'),
             elevation: 0.0,
             titleTextStyle: TextStyle(
               color: Colors.white,
               fontSize: 20.0,
               fontWeight: FontWeight.bold,
             ),
             iconTheme: IconThemeData(
               color: Colors.white,
             ),
           ),
           bottomNavigationBarTheme: BottomNavigationBarThemeData(
             type: BottomNavigationBarType.fixed,
             selectedItemColor: Colors.deepOrange,
             unselectedItemColor: Colors.grey,
             elevation: 50.0,
             backgroundColor: HexColor('333739'),
           ) ,
           textTheme: TextTheme(
             bodyText1: TextStyle(
               fontSize: 18.0,
               fontWeight: FontWeight.bold,
               color: Colors.white,
             ),
           ),
         ),
         themeMode: ThemeMode.light,
         home: Directionality(
           textDirection: TextDirection.rtl,
             child: NewsLayout(),
         ),
      ) ;
    }
}