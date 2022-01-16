import 'package:flutter/material.dart';
import 'package:tebiyancode/shared/companents/companents.dart';

//resusble components

//1.timing
//2.refactor
//3.quality
//4.clean code

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
    LoginScreen ({ Key? key }) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                const Text(
                  'login',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 05.0,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (String value){
                  // ignore: avoid_print
                  print(value);
                  },
                  onChanged: (String value){
                  // ignore: avoid_print
                  print(value);
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return 'email must not be empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'email',
                    prefixIcon: Icon(
                      Icons.email,
                      ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 05.0,
                  ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onFieldSubmitted: (String value){
                  // ignore: avoid_print
                  print(value);
                  },
                  onChanged: (String value){
                  // ignore: avoid_print
                  print(value);
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return 'password must not be empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'password',
                    prefixIcon: Icon(
                      Icons.lock,
                      ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 05.0,
                ),
                 defaultButton(
                   function: (){
                     if(formKey.currentState!.validate()){
                       print(emailController.text);
                       print(passwordController.text);
                     }

                     },
                   text: 'login',
                   fontsize: 25.0,
                     ),
                  const SizedBox(
                  height: 05.0,
                ),
                 defaultButton(
                   function: (){
                       print(emailController.text);
                       print(passwordController.text);
                     },
                   text: 'تسجيل الدخول',
                   isUpperCase: false,
                   background: Colors.red,
                   width: 200.0,
                   radius: 25.0,
                     ),
              const SizedBox(
                  height: 05.0,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?'
                    ),
                    TextButton(
                      onPressed: (){},
                      child:
                      const Text(
                        'Register Now',
                        ),

                      ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}