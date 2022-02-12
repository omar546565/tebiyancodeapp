import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/social_app/social_layout.dart';
import 'package:tebiyancode/modules/social_app/social_register/cubit/cubit.dart';
import 'package:tebiyancode/modules/social_app/social_register/cubit/states.dart';
import '../../../shared/companents/companents.dart';
import '../../../shared/companents/constants.dart';
import '../../../shared/network/local/cache_helper.dart';


class SocialRegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {



    return   BlocProvider(
      create: (BuildContext context) => SocialRegisterCubit(),
      child:BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
        listener:(context, state) {
          if(state is SocialCreateUserSuccessState)
          {
           navigateAndFinish(context,
               SocialLayout(),
           );
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

                          isPassword: SocialRegisterCubit.get(context).isPassword,
                          suffixPressed: (){
                            SocialRegisterCubit.get(context).changePasswordVisibility();
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
                              SocialRegisterCubit.get(context).userRegister(
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
