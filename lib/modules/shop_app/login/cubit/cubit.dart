import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/modules/shop_app/login/cubit/states.dart';
import 'package:tebiyancode/shared/network/remote/dio_helper.dart';

import '../../../../models/shop_app/login_model.dart';
import '../../../../shared/network/end_points.dart';

class ShopLoginCubit extends  Cubit<ShopLoginStates>
{
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

 late ShopLoginModel loginModel;


  void userLogin({
  required String email,
  required String password,
})
  {

    emit(ShopLoginLoadingState());
    DioHelper.postData(
      url:LOGIN,
      data:{
        'email':email,
        'password':password,

      },
    ).then((value) {

       loginModel =   ShopLoginModel.fromJson(value.data);
       emit(ShopLoginSuccessState(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(error.toString(),),);
    });
  }
 IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
   emit(ShopchangePasswordVisibilityState());

  }
}
