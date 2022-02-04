import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tebiyancode/layout/shop_app/cubit/cubit.dart';
import 'package:tebiyancode/layout/shop_app/shop_layout.dart';
import 'package:tebiyancode/modules/shop_app/login/shop_login_screen.dart';
import 'package:tebiyancode/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:tebiyancode/shared/bloc_observer.dart';
import 'package:tebiyancode/shared/cubit/states.dart';
import 'package:tebiyancode/shared/network/local/cache_helper.dart';
import 'package:tebiyancode/shared/network/remote/dio_helper.dart';
import 'package:tebiyancode/shared/styles/themes.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'shared/cubit/cubit.dart';



void main() async {
  HttpOverrides.global = new MyHttpOverrides();
   WidgetsFlutterBinding.ensureInitialized();
   //بيتأكد أن كل حاجة هنا في الميثود خلصت وبعدين بفتح الابلكيشن

  BlocOverrides.runZoned(
        () {
      // Use cubits...
          NewsCubit();
    },
    blocObserver: MyBlocObserver(),
  );

  DioHelper.init();
 await  CacheHelper.init();

 bool? isDark = CacheHelper.getData(key: 'isDark');

 Widget widget;

 bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
 String? token = CacheHelper.getData(key: 'token');

 if(onBoarding != null){
   if(token != null) widget = ShopLayout();
   else widget = ShopLoginScreen();
 }else{
   widget = OnBoardingScreen();
 }

  runApp( MyApp(
      isDark: isDark,
    startWidget: widget,
  ));

}

class MyApp  extends StatelessWidget
{
  late final bool? isDark;
  late final Widget? startWidget;

  MyApp({
    this.isDark,
    this.startWidget,
  });

    @override
    Widget build(BuildContext context) 
    {
      // ignore: prefer_const_constructors
      return MultiBlocProvider(
        providers:
        [
          BlocProvider(create: (context)=>  NewsCubit()..getBusiness()),
          BlocProvider(  create: (BuildContext context) => AppCubit()..changeAppMode(
               fromShared: isDark,
                        ),
          ),
          BlocProvider(  create: (BuildContext context) => ShopCubit()..getHomeData(),
          ),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
           listener: (context , state) {},
           builder: (context, state) {
          return   MaterialApp(
             debugShowCheckedModeBanner: false,
             theme:LightTheme ,
             darkTheme:DarkTheme,
             themeMode: AppCubit.get(context).isDark ? ThemeMode.dark :  ThemeMode.light ,
             home: Directionality(
             textDirection: TextDirection.ltr,
             child: startWidget!,
             ),
             );
           },
        ),
      ) ;
    }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}