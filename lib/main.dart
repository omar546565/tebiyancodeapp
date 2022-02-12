import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tbib_splash_screen/splash_screen.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';
import 'package:tebiyancode/layout/shop_app/cubit/cubit.dart';
import 'package:tebiyancode/layout/shop_app/shop_layout.dart';
import 'package:tebiyancode/layout/social_app/cubit/cubit.dart';
import 'package:tebiyancode/layout/social_app/social_layout.dart';
import 'package:tebiyancode/modules/shop_app/login/shop_login_screen.dart';
import 'package:tebiyancode/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:tebiyancode/modules/social_app/social_login_screen/social_login_screen.dart';
import 'package:tebiyancode/modules/splashscreen/splash_screen.dart';
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
  await Firebase.initializeApp();
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
 var uId = CacheHelper.getData(key: 'uId');

 /*if(onBoarding != null){
   if(token != null) widget = ShopLayout();
   else widget = ShopLoginScreen();
 }else{
   widget = OnBoardingScreen();
 }*/
if (uId != null){
  FlutterNativeSplash.removeAfter(initialization);
  widget = MyHomePage();
}else{
  widget = SocialLoginScreen();
}

  runApp( MyApp(
      isDark: isDark,
    startWidget: widget,
  ));

}
void initialization(BuildContext context) async {
  // This is where you can initialize the resources needed by your app while
  // the splash screen is displayed.  Remove the following example because
  // delaying the user experience is a bad design practice!
  // ignore_for_file: avoid_print


  await Future.delayed(const Duration(seconds: 1));
  print('go!');
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
          BlocProvider(  create: (BuildContext context) => ShopCubit()..getHomeData()..getCategoriesData()..getFavoritesModel()..getUserData(),
          ),
          BlocProvider(  create: (BuildContext context) => SocialCubit()..getUserData(),
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
             home: startWidget,
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