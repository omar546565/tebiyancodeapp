import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/shop_app/cubit/cubit.dart';
import 'package:tebiyancode/layout/shop_app/cubit/states.dart';
import 'package:tebiyancode/modules/shop_app/register/cubit/cubit.dart';
import 'package:tebiyancode/modules/shop_app/register/cubit/states.dart';

import '../../../layout/shop_app/shop_layout.dart';
import '../../../shared/companents/companents.dart';
import '../../../shared/companents/constants.dart';
import '../../../shared/network/local/cache_helper.dart';


class ShopRegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {



    return   BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child:BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener:(context, state) {
          if(state is ShopRegisterSuccessState)
          {
            if(state.loginModel.success){

              print(state.loginModel.message);
              print(state.loginModel.token);

              CacheHelper.saveData(key: 'token', value: state.loginModel.token,).then((value)
              {
                token = CacheHelper.getData(key: 'token');
                navigateAndFinish(context,
                  ShopLayout(),
                );
                showToast(
                  text: state.loginModel.message,
                  state: ToastStates.SUCCESS,
                );
              },);

            }else{
              showToast(
                text: state.loginModel.message,
                state: ToastStates.ERROR,
              );
            }
          }

        },
        builder:(context, state){
          return  Scaffold(
            appBar: AppBar(),
            body:  Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key:formKey ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Register',
                          style:  Theme.of(context).textTheme.headline4,
                        ),
                        Text('Register now to browes our hot offers',
                          style:  Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 30.0,),

                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          label: 'name',
                          prefix: Icons.perm_contact_calendar_rounded,
                          validate: (value){
                            if(value!.isEmpty){
                              return 'name must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 30.0,),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          label: 'phone',
                          prefix: Icons.phone,
                          validate: (value){
                            if(value!.isEmpty){
                              return 'phone must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.0,),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'Email Address',
                          prefix: Icons.email,
                          validate: (value){
                            if(value!.isEmpty){
                              return 'email must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.0,),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'password',
                          prefix: Icons.lock,

                          isPassword: ShopRegisterCubit.get(context).isPassword,
                          suffixPressed: (){
                            ShopRegisterCubit.get(context).changePasswordVisibility();
                          },
                          validate: (value){
                            if(value!.isEmpty){
                              return 'password must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0,),
                        defaultButton(
                          function: (){
                            if(formKey.currentState!.validate()){
                              ShopRegisterCubit.get(context).userRegister(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                                phone: phoneController.text,
                              );

                            }

                          },
                          text: 'Register',
                          isUpperCase: true,
                        ),



                        SizedBox(height: 20.0,),


                      ],
                    ),
                  ),
                ),
              ),
            ),

          );
        },
      ),
    );

  }
}
