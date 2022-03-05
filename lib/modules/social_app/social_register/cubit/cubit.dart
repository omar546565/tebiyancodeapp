import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/modules/social_app/social_register/cubit/states.dart';
import 'package:tebiyancode/shared/network/end_points.dart';

import '../../../../models/social_app/socail_user_model.dart';
import '../../../../shared/network/remote/dio_helper.dart';

class SocialRegisterCubit extends  Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialLoginInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);




  void userRegister({
    required String email,
    required String password,
    required String phone,
    required String name,
  })
  {

    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      userCreate(
        uId: value.user!.uid,
        name: name,
        email: email,
        phone: phone,
        bio: 'write you bio ......',
        image: 'https://www.itkan.online/profile/text/img_avatar_maleo.png',
        cover: 'https://img.freepik.com/free-photo/abstract-empty-smooth-light-pink-studio-room-background-use-as-montage-product-display-banner-template_1258-71403.jpg?w=1380',
        isEmailVerified:false,
      );
    }).catchError((error){
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void userCreate ({
    required String email,
    required String phone,
    required String name,
    required String uId,
    required String image,
    required String cover,
    required String bio,
    required bool  isEmailVerified,

  })
  {
    SocialUserModel model= SocialUserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      bio: bio,
      image: 'https://www.itkan.online/profile/text/img_avatar_maleo.png',
      cover: 'https://img.freepik.com/free-photo/abstract-empty-smooth-light-pink-studio-room-background-use-as-montage-product-display-banner-template_1258-71403.jpg?w=1380',
      isEmailVerified: isEmailVerified,
    );
       FirebaseFirestore
           .instance
           .collection('users')
           .doc(uId).set(
         model.toMap(),
       ).then((value) {
       emit(SocialCreateUserSuccessState());
       }).catchError((error){
         print(error.toString());
         emit(SocialCreateUserErrorState(error.toString()));
       });
  }


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialchangePasswordVisibilityRegisterState());

  }
}