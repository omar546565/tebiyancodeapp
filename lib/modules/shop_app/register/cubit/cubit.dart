import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/models/shop_app/login_model.dart';
import 'package:tebiyancode/modules/shop_app/register/cubit/states.dart';
import 'package:tebiyancode/shared/network/end_points.dart';

import '../../../../shared/network/remote/dio_helper.dart';

class ShopRegisterCubit extends  Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopLoginInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  late ShopLoginModel? loginModel;


  void userRegister({
    required String email,
    required String password,
    required String phone,
    required String name,
  })
  {

    emit(ShopRegisterLoadingState());
    DioHelper.postData(
      url:REGISTER,
      data:{
        'email':email,
        'password':password,
        'phone':phone,
        'name':name,

      },
    ).then((value) {

      loginModel = ShopLoginModel.fromJson(value.data);

      emit(ShopRegisterSuccessState(loginModel!));

    }).catchError((error){
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString(),),);
    });
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopchangePasswordVisibilityRegisterState());

  }
}