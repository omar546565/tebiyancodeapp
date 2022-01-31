import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/shop_app/cubit/cubit.dart';
import 'package:tebiyancode/layout/shop_app/cubit/states.dart';
import 'package:tebiyancode/modules/shop_app/login/shop_login_screen.dart';
import 'package:tebiyancode/shared/companents/companents.dart';
import 'package:tebiyancode/shared/network/local/cache_helper.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
       listener:(context,state) {},
       builder: (context,state) {
        return Scaffold(
           appBar: AppBar(
             title: Text(
               'Salla',
             ),
           ),
           body: TextButton(
             onPressed: ()
             {
               CacheHelper.removeData(key: 'token').then((value) {
                 if(value){
                   navigateAndFinish(context,
                     ShopLoginScreen(),
                   );
                 }
               });
             },
             child: Text(
               'SignOut',

             ),
           ),
         );
       },
    );
  }
}
