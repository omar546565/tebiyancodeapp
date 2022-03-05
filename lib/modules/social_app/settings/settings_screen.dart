import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/social_app/cubit/cubit.dart';
import 'package:tebiyancode/layout/social_app/cubit/states.dart';
import 'package:tebiyancode/shared/companents/companents.dart';

import '../edit_profile/edit_profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<SocialCubit,SocialStates>(
       listener:(context, state){} ,
       builder:(context, state){
         var userModel = SocialCubit.get(context).model;
         return Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               Container(
                 height: 200.0,
                 child: Stack(
                   alignment: AlignmentDirectional.bottomCenter,
                   children: [
                     Align(
                       child: Container(
                         height: 150.0,
                         width: double.infinity,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(4.0,),
                             topRight: Radius.circular(4.0,),
                           ) ,
                           image: DecorationImage(
                             image: NetworkImage('${userModel!.cover}') ,
                             fit: BoxFit.cover,
                           ),
                         ) ,
                       ),
                       alignment: AlignmentDirectional.topCenter,
                     ),
                     CircleAvatar(
                       radius: 64.0,
                       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                       child: CircleAvatar(
                         radius: 60.0,
                         backgroundImage: NetworkImage('${userModel.image}'),
                       ),
                     ),
                   ],
                 ),
               ),
               SizedBox(height: 5.0,),
               Text(
                 '${userModel.name}',
                 style: Theme.of(context).textTheme.bodyText1,
               ),
               Text(
                 '${userModel.bio}',
                 style: Theme.of(context).textTheme.caption,
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(
                   vertical: 20.0,
                 ),
                 child: Row(
                   children: [
                     Expanded(
                       child: InkWell(
                         child: Column(
                           children: [
                             Text(
                               '54',
                               style: Theme.of(context).textTheme.subtitle2,
                             ),
                             Text(
                               'الاصدقاء',
                               style: Theme.of(context).textTheme.caption,
                             ),
                           ],
                         ),
                         onTap: (){},
                       ),
                     ),
                     Expanded(
                       child: InkWell(
                         child: Column(
                           children: [
                             Text(
                               '100',
                               style: Theme.of(context).textTheme.subtitle2,
                             ),
                             Text(
                               'بوستات',
                               style: Theme.of(context).textTheme.caption,
                             ),
                           ],
                         ),
                         onTap: (){},
                       ),
                     ),
                     Expanded(
                       child: InkWell(
                         child: Column(
                           children: [
                             Text(
                               'k 10',
                               style: Theme.of(context).textTheme.subtitle2,
                             ),
                             Text(
                               'المتابعون',
                               style: Theme.of(context).textTheme.caption,
                             ),
                           ],
                         ),
                         onTap: (){},
                       ),
                     ),
                     Expanded(
                       child: InkWell(
                         child: Column(
                           children: [
                             Text(
                               '265',
                               style: Theme.of(context).textTheme.subtitle2,
                             ),
                             Text(
                               'الصور',
                               style: Theme.of(context).textTheme.caption,
                             ),
                           ],
                         ),
                         onTap: (){},
                       ),
                     ),
                   ],
                 ),
               ),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Expanded(
                     child: OutlinedButton(
                       onPressed: () {  },
                       child: Text(
                         'إضافة الصور',
                       ),

                     ) ,
                   ),
                   SizedBox(width: 10.0,),
                   OutlinedButton(
                     onPressed: () {
                       navigateTo(context,EditProfileScreen(),);
                     },
                     child:Icon(Icons.edit) ,
                   ) ,
                 ],
               )
             ],
           ),
         );
       } ,
    );
  }
}
