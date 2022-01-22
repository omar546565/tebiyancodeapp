import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/news_app/cubit/states.dart';
import 'package:tebiyancode/modules/business/business_screen.dart';
import 'package:tebiyancode/modules/science/science_screen.dart';
import 'package:tebiyancode/modules/settings_screen/settings_screen.dart';
import 'package:tebiyancode/modules/sports/sports_screen.dart';

import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;

  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
      label:'business' ,
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
      label:'sports' ,
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
      label:'science' ,
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings),
      label:'settings' ,
    ),
  ];

  List<Widget> screen = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];


  void changeBottomNavBar(int index)
  {
    currentIndex = index;
    if(index == 1)
      getSports();
    if(index == 2)
      getScience();

    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness()
  {
    emit(NewsgetBusinessLoadingState());
    DioHelper().getData(url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'business',
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {

      business = value.data['articles'];
      print(business[0]['title']) ;
      emit(NewsgetBusinessSuccessState());
    }).catchError((error){
      print(error.toString()) ;
      emit(NewsgetBusinessErrorState(error.toString()));
    });
  }

 List<dynamic> sports = [];

  void getSports()
  {
    emit(NewsgetSportsLoadingState());
    if(sports.length == 0){
      DioHelper().getData(url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {

        sports = value.data['articles'];
        print(sports[0]['title']) ;
        emit(NewsgetSportsSuccessState());
      }).catchError((error){
        print(error.toString()) ;
        emit(NewsgetSportsErrorState(error.toString()));
      });
    }else{
      emit(NewsgetScienceSuccessState());
    }

  }

 List<dynamic> science = [];

  void getScience()
  {
    emit(NewsgetScienceLoadingState());
    if(science.length == 0){
      DioHelper().getData(url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {

        science = value.data['articles'];
        print(science[0]['title']) ;
        emit(NewsgetScienceSuccessState());
      }).catchError((error){
        print(error.toString()) ;
        emit(NewsgetScienceErrorState(error.toString()));
      });
    }else{
      emit(NewsgetScienceSuccessState());
    }
    }



}