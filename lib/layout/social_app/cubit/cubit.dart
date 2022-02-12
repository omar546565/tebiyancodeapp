import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/social_app/cubit/states.dart';
import '../../../models/social_app/socail_user_model.dart';
import '../../../shared/companents/constants.dart';


class SocialCubit extends  Cubit<SocialStates>{
  SocialCubit() : super(SocialInitialState());
  static SocialCubit get(context) => BlocProvider.of(context);

  SocialUserModel? model;

  void getUserData()
  {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore
        .instance
        .collection('users')
        .doc(uId).get()
        .then((value) {
          model = SocialUserModel.fromJson(value.data()!);
          emit( SocialGetUserSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
    });

  }


}

