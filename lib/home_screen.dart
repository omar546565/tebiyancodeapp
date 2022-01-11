import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget 
{
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu,) ,
        title: Text('tebiyancode',),
        actions: 
        [
          IconButton(
            icon: Icon(
            Icons.notification_important,
          ),
            onPressed: onNotificaltion,
            ),
          IconButton(
            icon: Text('hello'), 
          onPressed: () {
            print('hello');
            }, ),
          
        ],
        
      ),
    );
  }

  void onNotificaltion(){
    print('Notificaltion clicked');
  }
}


