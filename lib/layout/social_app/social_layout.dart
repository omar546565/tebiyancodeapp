import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:tebiyancode/layout/social_app/cubit/cubit.dart';
import 'package:tebiyancode/layout/social_app/cubit/states.dart';
import 'package:tebiyancode/shared/companents/companents.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SocialCubit,SocialStates>(
      listener:(context,state) {},
      builder: (context,state) {
        var model = SocialCubit.get(context).model;
        return Scaffold(
          appBar:AppBar(
         title:  Text('home')
          ),

          body: Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) =>
            model != null,
            widgetBuilder: (BuildContext context) {
              return    Column
                (
                children: [
                    Container(
                      color: Colors.amberAccent.withOpacity(.7),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.info_outline),
                            SizedBox(width: 15.0,),
                            Expanded(child: Text("please verify ")),
                            Expanded(child: Text(model!.email)),
                            SizedBox(width: 15.0,),
                            defaultTextButton(
                              function: (){
                                FirebaseAuth.instance.currentUser!
                                    .sendEmailVerification()
                                    .then((value) {
                                  showToast(
                                    text: 'check your email',
                                    state: ToastStates.SUCCESS,);
                                }).catchError((error){
                                  showToast(
                                    text: 'ERROR your email',
                                    state: ToastStates.ERROR,);
                                });
                              },
                              text: 'sent email ',
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              );
            },
            fallbackBuilder: (BuildContext context) {
              return   CircularProgressIndicator();
            },
          ),
        );
      },
    );
  }
}
