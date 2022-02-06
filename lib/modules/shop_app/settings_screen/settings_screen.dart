import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/shop_app/cubit/cubit.dart';
import 'package:tebiyancode/layout/shop_app/cubit/states.dart';
import 'package:tebiyancode/shared/companents/companents.dart';
import 'package:tebiyancode/shared/companents/constants.dart';

class SettingsScreen extends StatelessWidget
{

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {

 var   cubit =  ShopCubit.get(context);

    return SingleChildScrollView(
      child: Container(
        child: BlocConsumer<ShopCubit,ShopStates>(
          listener:(context, state){},
          builder: (context, state){

            nameController.text = cubit.userModel!.name.toString();
            emailController.text = cubit.userModel!.email.toString();
            phoneController.text = cubit.userModel!.phone.toString();

            return   cubit.userModel != null ?  Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  defaultFormField
                    (
                    controller: nameController,
                    type: TextInputType.name,
                    validate: (value){
                      if(value.isEmpty){
                        return 'يرجى كتابة الاسم';
                      }
                      return null;
                    },
                    label: 'name',
                    prefix: Icons.perm_identity,

                  ),
                  SizedBox(height:20.0,),
                  defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (value){
                      if(value.isEmpty){
                        return 'يرجى كتابة الإيميل';
                      }
                      return null;
                    },
                    label: 'emailAddress',
                    prefix: Icons.email,

                  ),
                  SizedBox(height:20.0,),
                  defaultFormField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    validate: (value){
                      if(value.isEmpty){
                        return 'يرجى كتابة الهاتف';
                      }
                      return null;
                    },
                    label: 'phone',
                    prefix: Icons.phone,

                  ),
                  SizedBox(height:20.0,),
                  defaultButton(
                      function: (){
                        signOut(context);
                      },
                      text: 'تسجيل الخروج',
                  ),
                ],
              ),
            ) : Center(child: Text('لايوجد بيانات',),);
          },

        ),
      ),
    );
  }
}
