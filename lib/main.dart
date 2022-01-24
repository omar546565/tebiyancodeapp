import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
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

 bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp( MyApp(isDark));

}

class MyApp  extends StatelessWidget
{
  late final bool? isDark;

  MyApp(this.isDark);

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
             child: OnBoardingScreen(),
             ),
             );
           },
        ),
      ) ;
    }
}