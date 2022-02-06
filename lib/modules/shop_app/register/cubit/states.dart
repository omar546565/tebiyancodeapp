import '../../../../models/shop_app/login_model.dart';

abstract class  ShopRegisterStates {}

class ShopLoginInitialState extends ShopRegisterStates {}

class ShopRegisterLoadingState extends ShopRegisterStates {}

class ShopRegisterSuccessState extends ShopRegisterStates
{
  final ShopLoginModel loginModel;

  ShopRegisterSuccessState(this.loginModel);

}

class ShopRegisterErrorState extends ShopRegisterStates
{
  final String  error;

  ShopRegisterErrorState(this.error);
}

class ShopchangePasswordVisibilityRegisterState extends ShopRegisterStates {}