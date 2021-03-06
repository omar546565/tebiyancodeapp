import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/shop_app/cubit/cubit.dart';
import 'package:tebiyancode/layout/shop_app/cubit/states.dart';
import 'package:tebiyancode/shared/companents/companents.dart';
import 'package:tebiyancode/shared/companents/constants.dart';

class SettingsScreen extends StatelessWidget
{
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

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
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(cubit.userModel!.image.toString()),
                    ),

                    if(state is ShopLoadingUpdateUserDataState)
                    LinearProgressIndicator(),
                    SizedBox(height:20.0,),
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
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (value){
                        return null;
                      },
                      label: 'password',
                      prefix: Icons.password,

                    ),
                    SizedBox(height:20.0,),
                    defaultButton(
                        function: (){
                          if(formKey.currentState!.validate()){
                            ShopCubit.get(context).updateUserData(
                              password: passwordController.text,
                              name: nameController.text,
                              phone: phoneController.text,
                            );

                          }
                        },
                        text: 'update',
                    ),
                    SizedBox(height:20.0,),
                    defaultButton(
                        function: (){
                          signOut(context);
                          cubit.getUserOut();
                        },
                        text: 'تسجيل الخروج',
                    ),
                  ],
                ),
              ),
            ) : Center(child: Text('لايوجد بيانات',),);
          },

        ),
      ),
    );
  }
}
