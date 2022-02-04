import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/shop_app/cubit/states.dart';
import 'package:tebiyancode/shared/network/end_points.dart';

import '../../../models/shop_app/home_model_shop.dart';
import '../../../modules/shop_app/categories_screen/categories_screen.dart';
import '../../../modules/shop_app/favorites-screen/favorites-screen.dart';
import '../../../modules/shop_app/products_screen/products_screen.dart';
import '../../../modules/shop_app/settings_screen/settings_screen.dart';
import '../../../shared/companents/constants.dart';
import '../../../shared/network/remote/dio_helper.dart';


class ShopCubit extends  Cubit<ShopStates>{
  ShopCubit() : super(ShopInitialState());
  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;

  List<Widget> bottomScreens =
      [
        ProductsScreen(),
        CategoriesScreen(),
        FavoritesScreen(),
        SettingsScreen(),
      ];

  void changeBottom(int index)
  {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;




  void getHomeData()
  {
  emit(ShopLoadingHomeState());
  DioHelper.getData(
      url: HOME,
      token: token,
  ).then((value)
  {
    homeModel= HomeModel.fromJson(value.data);
    printFullText(homeModel!.message.toString());
    printFullText(homeModel!.data.banners[0].image);

    emit(ShopSuccessHomeState());
  }).catchError((error){
    print(error.toString(),);

    emit(ShopErrorHomeState());
  });

  }


}

