import 'package:tebiyancode/models/shop_app/change_favorites_model.dart';

import '../../../../models/shop_app/login_model.dart';

abstract class  ShopStates {}


class ShopInitialState extends ShopStates{}

class ShopChangeBottomNavState extends ShopStates{}


class ShopLoadingHomeState extends ShopStates{}

class ShopSuccessHomeState extends ShopStates{}

class ShopErrorHomeState extends ShopStates{}

class ShopSuccessCategoriesState extends ShopStates{}

class ShopErrorCategoriesState extends ShopStates{}


class ShopSuccessFavoritesState extends ShopStates{}
class ShopSuccessChangeFavoritesState extends ShopStates{}

class ShopErrorFavoritesState extends ShopStates{}


class ShopLoadingGetFavoritesState extends ShopStates{}

class ShopSuccessGetFavoritesState extends ShopStates{}

class ShopErrorGetFavoritesState extends ShopStates{}


