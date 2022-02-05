import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/shop_app/cubit/states.dart';
import 'package:tebiyancode/models/shop_app/categories_model_shop.dart';
import 'package:tebiyancode/shared/network/end_points.dart';

import '../../../models/shop_app/change_favorites_model.dart';
import '../../../models/shop_app/favorites_model.dart';
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

  Map<int ,String> favorites = {};

  void getHomeData()
  {
  emit(ShopLoadingHomeState());
  DioHelper.getData(
      url: HOME,
      token: token,
  ).then((value)
  {
    homeModel= HomeModel.fromJson(value.data);
    
    
    homeModel!.data.products.forEach((element) {
      favorites.addAll({
        element.id : element.inFavorites,
      });
    });
    print(favorites.toString(),);
    emit(ShopSuccessHomeState());
  }).catchError((error){
    print(error.toString(),);

    emit(ShopErrorHomeState());
  });

  }

CategoriesModel? categoriesModel;

  void getCategoriesData()
  {

  DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
  ).then((value)
  {
    categoriesModel = CategoriesModel.fromJson(value.data);
    printFullText(categoriesModel!.data.data[0].image.toString());


    emit(ShopSuccessCategoriesState());
  }).catchError((error){
    print(error.toString(),);

    emit(ShopErrorCategoriesState());
  });

  }

  FavoritesModel? favoritesModel;

  void getFavoritesModel()
  {
   emit(ShopLoadingGetFavoritesState());
  DioHelper.getData(
      url: FAVORITES,
      token: token,
  ).then((value)
  {
    favoritesModel = FavoritesModel.fromJson(value.data);
    printFullText(favoritesModel!.products![0].image.toString());

    emit(ShopSuccessGetFavoritesState());
  }).catchError((error){
    print(error.toString(),);

    emit(ShopErrorGetFavoritesState());
  });

  }




  ChangeFavoritesModel? changeFavoritesModel;

 void changeFavorites(int productId)
 {


   if(favorites[productId] == 'true'){
     favorites[productId] = 'false';
   }else if(favorites[productId] == 'false'){
     favorites[productId] = 'true';
   }


   emit(ShopSuccessFavoritesState());


   DioHelper.postData(
     url: FAVORITES,
     data: {
       'product_id':productId,
     },
     token: token,
   ).then((value) {
     changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
     if(!changeFavoritesModel!.status){
       if(favorites[productId] == 'true'){
         favorites[productId] = 'false';
       }else if(favorites[productId] == 'false'){
         favorites[productId] = 'true';
       }
     }else{
       getFavoritesModel();
     }
     print(changeFavoritesModel!.status);
emit(ShopSuccessChangeFavoritesState());
   }).catchError((error){
     if(favorites[productId] == 'true'){
       favorites[productId] = 'false';
     }else if(favorites[productId] == 'false'){
       favorites[productId] = 'true';
     }
     print(error.toString(),);

emit(ShopSuccessChangeFavoritesState());
   });
 }
}

