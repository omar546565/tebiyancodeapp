import 'package:flutter/material.dart';
import 'package:tebiyancode/home_screen_column.dart';


class HomeScreenScrollView extends StatelessWidget 
{
  const HomeScreenScrollView({Key? key}) : super(key: key);

  

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
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // ignore: avoid_unnecessary_containers
        child: Row(
          children: const [
            Text(
              'data',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data2',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data3',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data4',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data2',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data3',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data4',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data2',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data3',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data4',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data2',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data3',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data4',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data2',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data3',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data4',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data2',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data3',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data4',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data2',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data3',
              style: TextStyle(
                fontSize: 30.0,
              ),
              ),
            Text(
              'data4',
              style: TextStyle(
                fontSize: 30.0,
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


