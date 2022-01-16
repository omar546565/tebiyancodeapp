import 'package:flutter/material.dart';
import 'package:tebiyancode/modules/home/home_screen.dart';

class HomeScreenExdented extends StatelessWidget 
{
  const HomeScreenExdented({Key? key}) : super(key: key);

  

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
            icon: const Text('page1'
            ), 
          // ignore: avoid_print
          onPressed: () { _navigateToNext(context);},
           ),
        ],
        
      ),
      body: Container(
        color: Colors.purpleAccent,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children:  [
             // ignore: avoid_unnecessary_containers
             Expanded(
               child: Container(
                 color:  Colors.red ,
                 child: const Text( 
                   'omar',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 30.0,
                  
                   ),
                 ),
               ),
             ),
             Expanded(
               child: Container(
                 color:  Colors.green ,
                 child: const Text(
                   'omar2',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 30.0,
                   ),
                 ),
               ),
             ),
             Expanded(
               child: Container(
                 color:  Colors.blue ,
                 child: const Text(
                   'omar3',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 30.0,
                   ),
                 ),
               ),
             ),
             Expanded(
               child: Container(
                 color:  Colors.amber ,
                 child: const Text(
                   'omar4',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 30.0,
                   ),
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
   void _navigateToNext(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}


