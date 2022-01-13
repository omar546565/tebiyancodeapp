

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
    LoginScreen ({ Key? key }) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
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
              Container(
                width: double.infinity,
                color: Colors.blue,
                child: MaterialButton(
                  onPressed: (){
                    // ignore: avoid_print
                    print(emailController.text,);
                    // ignore: avoid_print
                    print(passwordController.text,);
                  },
                  child: const Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                ),
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
    );
  }
}