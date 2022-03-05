import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/social_app/cubit/states.dart';
import 'package:tebiyancode/modules/social_app/chats/chats_screen.dart';
import 'package:tebiyancode/modules/social_app/feeds/feeds_screen.dart';
import 'package:tebiyancode/modules/social_app/settings/settings_screen.dart';
import 'package:tebiyancode/modules/social_app/users/users_screen.dart';
import '../../../models/social_app/socail_user_model.dart';
import '../../../shared/companents/constants.dart';


class SocialCubit extends  Cubit<SocialStates>{
  SocialCubit() : super(SocialInitialState());
  static SocialCubit get(context) => BlocProvider.of(context);

  SocialUserModel? model;

  void getUserData()
  {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore
        .instance
        .collection('users')
        .doc(uId).get()
        .then((value) {

       print(value.data());
        model =  SocialUserModel.fromJson(value.data()!);

      emit( SocialGetUserSuccessState());
       model =  SocialUserModel.fromJson(value.data()!);
       emit(SocialGetUserLoadingState());
       emit( SocialGetUserSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
    });

  }

  int currentIndex = 0;

  List<Widget> screens = [
    FeedsScreen(),
    ChatsScreen(),
    UsersScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];
  List<String> titles = [
    'الرئيسية',
    'المحادثات',
    'المستخدمون',
    'المستخدمون',
    'الإعدادت',
  ];

 void changeBottomNav(int index){
   if(index == 2)
     {
       emit(SocialNewPostState(),);
     }
   else
     {currentIndex = index;
     emit(SocialChangeBottomNavState(),);
     }

 }
}

