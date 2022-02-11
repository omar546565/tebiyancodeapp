import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/modules/social_app/social_register/cubit/states.dart';
import 'package:tebiyancode/shared/network/end_points.dart';

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
      print(value.user!.email);
      print(value.user!.uid);
      emit(SocialRegisterSuccessState());
    }).catchError((error){
      emit(SocialRegisterErrorState(error.toString()));
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