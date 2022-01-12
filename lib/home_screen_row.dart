import 'package:flutter/material.dart';
import 'package:tebiyancode/home_screen_column.dart';


class HomeScreenRow extends StatelessWidget 
{
  const HomeScreenRow({Key? key}) : super(key: key);

  

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
            icon: const Text('pagecolumn'
            ), 
          // ignore: avoid_print
          onPressed: () { _navigateToNextcolumn(context);},
           ),
        ],
        
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        color: Colors.purpleAccent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:   [
             // ignore: avoid_unnecessary_containers
             Container(
               color: Colors.red,
               child: const Text( 
                 'omar',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20.0,
                 ),
               ),
             ),
             // ignore: avoid_unnecessary_containers
             Container(
                color: Colors.green,
               child: const Text( 
                 'omar2',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20.0,
                 ),
               ),
             ),
             // ignore: avoid_unnecessary_containers
             Container(
                color: Colors.blue,
               child: const Text( 
                 'omar3',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20.0,
                 ),
               ),
             ),
             // ignore: avoid_unnecessary_containers
             Container(
              color: Colors.amber,
               child: const Text( 
                 'omar4',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20.0,
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
   void _navigateToNextcolumn(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreenColumn()));
  }
}


