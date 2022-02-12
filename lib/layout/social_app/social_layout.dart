import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/social_app/cubit/cubit.dart';
import 'package:tebiyancode/layout/social_app/cubit/states.dart';
import 'package:tebiyancode/shared/companents/companents.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = SocialCubit.get(context).model!;
    return BlocConsumer<SocialCubit,SocialStates>(
      listener:(context,state) {},
      builder: (context,state) {
        var cubit= SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('home'),
          ),
          body: SocialCubit.get(context).model.toString() != null ? Column
            (
            children: [
              if(!model.isEmailVerified)
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
                      Expanded(child: Text("please verify your email")),
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
          ) : CircularProgressIndicator(),
        );
      },
    );
  }
}
