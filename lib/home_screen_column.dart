import 'package:flutter/material.dart';
import 'package:tebiyancode/home_screen_exdented.dart';

class HomeScreenColumn extends StatelessWidget 
{
  const HomeScreenColumn({Key? key}) : super(key: key);

  

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
            icon: const Text('page2'
            ), 
          // ignore: avoid_print
          onPressed: () { _navigateToNextScreen(context);},
           ),
        ],
        
      ),
      body: Container(
        color: Colors.purpleAccent,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
             // ignore: avoid_unnecessary_containers
             Container(
               color:  Colors.red ,
               child: const Text( 
                 'omar',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 30.0,
                
                 ),
               ),
             ),
              
            
          ],
          ),
      ),
    );
  }

  void onNotificaltion(){
    // ignore: avoid_print
    print('Notificaltion clicked');
  }
   void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreenExdented()));
  }
}


