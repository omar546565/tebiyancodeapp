import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/modules/social_app/social_login_screen/cubit/states.dart';
import 'package:tebiyancode/shared/network/remote/dio_helper.dart';
import '../../../../shared/network/end_points.dart';

class SocialLoginCubit extends  Cubit<SocialLoginStates>
{
  SocialLoginCubit() : super(SocialLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);



  void userLogin({
  required String email,
  required String password,
})
  {

    emit(SocialLoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      print(value.user!.email);
      emit(SocialLoginSuccessState());
    }).catchError((error){

      emit(SocialLoginErrorState(error.toString()));
    });
  }
 IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
   emit(SocialchangePasswordVisibilityState());

  }
}
