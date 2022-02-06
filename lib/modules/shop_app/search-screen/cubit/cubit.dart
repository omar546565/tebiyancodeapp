import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/models/shop_app/favorites_model.dart';
import 'package:tebiyancode/modules/shop_app/search-screen/cubit/states.dart';
import 'package:tebiyancode/shared/network/remote/dio_helper.dart';

import '../../../../models/shop_app/srearch_model.dart';
import '../../../../shared/companents/constants.dart';
import '../../../../shared/network/end_points.dart';

class ShopSearchCubit extends  Cubit<ShopSearchStates> {
  ShopSearchCubit() : super(ShopSearchInitialState());

  static ShopSearchCubit get(context) => BlocProvider.of(context);


  SrearchModel? srearchModel;

  void search(String text){
    emit(ShopSearchLoadingState(),);
       DioHelper.postData(
           url: PRODUCTS_SEARCH,
           token: token,
           data: {
             'Text':text,
           },).then((value) {
         srearchModel =   SrearchModel.fromJson(value.data);
         emit(ShopSearchSuccessState());
       }).catchError((error){
         print(error.toString());
         emit(ShopSearchErrorState(),);
       });
  }


}