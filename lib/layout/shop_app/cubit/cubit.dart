import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/shop_app/cubit/states.dart';


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
}

