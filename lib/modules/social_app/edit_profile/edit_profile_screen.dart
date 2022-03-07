import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tebiyancode/shared/companents/companents.dart';

import '../../../layout/social_app/cubit/cubit.dart';
import '../../../layout/social_app/cubit/states.dart';

class EditProfileScreen extends StatelessWidget {
   var nameController = TextEditingController();
   var bioController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
       listener:(context, state){} ,
      builder: (context, state){
        var userModel = SocialCubit.get(context).model;
       

        nameController.text = userModel!.name;
        bioController.text = userModel.bio;

         return Directionality(
           textDirection: TextDirection.rtl,
           child: Scaffold(
             appBar: AppBar(
               leading: IconButton(
                 icon: Icon(Icons.arrow_back_ios),
                 onPressed: () {
                   Navigator.pop(context);
                 },
               ),
               titleSpacing: 5.0,
               title: Text('تعديل البيانات',),
               actions: [
                 defaultTextButton(function: (){}, text: 'تحديث'),
                 SizedBox(width: 15.0,),
               ],
             ),
             body: SingleChildScrollView(
               physics: BouncingScrollPhysics(),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                     Container(
                       height: 200.0,
                       child: Stack(
                         alignment: AlignmentDirectional.bottomCenter,
                         children: [
                           Align(
                             child: Stack(
                               alignment: Alignment.topRight,
                               children: [
                                 Container(
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
                                 IconButton(
                                   onPressed: (){},
                                   icon: CircleAvatar(

                                   child: Icon(
                                       Icons.photo_camera_rounded),
                                 ),
                                 ),
                               ],
                             ),
                             alignment: AlignmentDirectional.topCenter,
                           ),
                           Stack(
                             alignment: Alignment.bottomRight,
                             children: [
                               CircleAvatar(
                                 radius: 64.0,
                                 backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                 child: CircleAvatar(
                                   radius: 60.0,
                                   backgroundImage:NetworkImage('${userModel.image}')  ,
                                 ),
                               ),
                               IconButton(
                                 onPressed: (){
                                  SocialCubit.get(context).getProfileImage();
                                 },
                                 icon: CircleAvatar(

                                   child: Icon(
                                       Icons.photo_camera_rounded),
                                 ),
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                     SizedBox(height: 5.0,),
                     defaultFormField(
                       controller: nameController,
                       type: TextInputType.text,
                       label: 'الاسم',
                       prefix: Icons.perm_contact_calendar_rounded,
                       suffix: Icons.perm_contact_calendar_rounded,
                       validate: (value){
                         if(value.isEmpty)
                         {
                           return 'يرجى إدخال الاسم';
                         }
                         return null;
                       },
                     ),
                     SizedBox(height: 20.0,),
                     defaultFormField(
                       controller: bioController,
                       type: TextInputType.text,
                       label: 'bio',
                       prefix: Icons.perm_contact_calendar_rounded,
                       suffix: Icons.perm_contact_calendar_rounded,
                       validate: (value){
                         if(value.isEmpty)
                         {
                           return 'يرجى إدخال bio';
                         }
                         return null;
                       },
                     ),
                   ],
                 ),
               ),
             ),
           ),
         );
      },
    );
  }
}
