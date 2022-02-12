import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/social_app/social_layout.dart';
import 'package:tebiyancode/modules/social_app/social_login_screen/cubit/cubit.dart';
import 'package:tebiyancode/modules/social_app/social_login_screen/cubit/states.dart';
import 'package:tebiyancode/modules/social_app/social_register/social_register_screen.dart';
import 'package:tebiyancode/shared/network/local/cache_helper.dart';

import '../../../shared/companents/companents.dart';

class SocialLoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();

    var passwordController = TextEditingController();
    return BlocProvider(
      create:(BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit,SocialLoginStates>(
        listener: (BuildContext context, state) {
          if(state is SocialLoginErrorState){
            showToast(text: state.error,
              state: ToastStates.ERROR,
            );
          }
            if(state is SocialLoginSuccessState){
              CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
                    navigateAndFinish(context,
                    SocialLayout(),
                    );
              });
            }


        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key:formKey ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LOGIN',
                          style:  Theme.of(context).textTheme.headline4,
                        ),
                        Text('login now to social',
                          style:  Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 30.0,),

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
                          suffix: SocialLoginCubit.get(context).suffix ,
                          onFieldSubmit: (value){
                            if(formKey.currentState!.validate())
                            {
                              SocialLoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            }
                          },
                          isPassword: SocialLoginCubit.get(context).isPassword,
                          suffixPressed: (){
                            SocialLoginCubit.get(context).changePasswordVisibility();
                          },
                          validate: (value){
                            if(value!.isEmpty){
                              return 'password must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0,),
                        state is SocialLoginLoadingState  ? Center(child: CircularProgressIndicator()) : defaultButton(
                          function: (){
                            if(formKey.currentState!.validate()){
                               SocialLoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            }

                          },
                          text: 'login',
                          isUpperCase: true,
                        ),



                        SizedBox(height: 20.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account',
                            ),
                            defaultTextButton(function: (){
                              navigateTo(context, SocialRegisterScreen(),);
                            },
                              text: 'register',
                            ),
                          ],
                        ),

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
