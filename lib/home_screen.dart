import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget 
{
  const HomeScreen({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu,) ,
        title:   const Text('tebiyancode',),
        actions: 
        [
          IconButton(
            icon:const Icon(Icons.notification_important,
            ),
            onPressed: onNotificaltion,
            ),
          IconButton(
            icon: const Text('hello'
            ), 
          // ignore: avoid_print
          onPressed: () { print('hello');},
           ),
        ],
        
      ),
    );
  }

  void onNotificaltion(){
    // ignore: avoid_print
    print('Notificaltion clicked');
  }
}


