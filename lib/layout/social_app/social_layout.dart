import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:tebiyancode/layout/social_app/cubit/cubit.dart';
import 'package:tebiyancode/layout/social_app/cubit/states.dart';
import 'package:tebiyancode/modules/social_app/new_post/new_post_screen.dart';
import 'package:tebiyancode/shared/companents/companents.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SocialCubit,SocialStates>(
      listener:(context,state) {
        if(state is SocialNewPostState){
          navigateTo(
            context,
            NewPostScreen(),
          );
        }
      },
      builder: (context,state) {
        var model = SocialCubit.get(context).model;
        var cubit = SocialCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar:AppBar(
           title:  Text(
             cubit.titles[cubit.currentIndex],
           ),
              actions: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.notifications),
                ),
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.search),
                ),
              ],
            ),

            body: cubit.screens[cubit.currentIndex] ,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap:(index) {
                cubit.changeBottomNav(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat,
                  ),
                  label: 'المحادثات',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_circle_outline,
                  ),
                  label: 'إضافة',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.portrait_sharp,
                  ),
                  label: 'المستخدمون',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: 'الإعدادت',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
