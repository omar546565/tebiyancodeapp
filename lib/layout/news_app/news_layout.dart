import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/news_app/cubit/cubit.dart';
import 'package:tebiyancode/layout/news_app/cubit/states.dart';
import 'package:tebiyancode/shared/network/remote/dio_helper.dart';

import '../../shared/cubit/cubit.dart';

class NewsLayout extends StatelessWidget
{
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context)=> NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit , NewsStates>(
        listener: (context, state){} ,
        builder: (context, state)
        {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'News App',
              ),
              actions: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.search),
                ),
                IconButton(
                    onPressed: ()
                    {
                      AppCubit.get(context).changeAppMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined),
                ),
              ],
            ),

            body:   cubit.screen[cubit.currentIndex] ,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        } ,
      ),
    );
  }
}
