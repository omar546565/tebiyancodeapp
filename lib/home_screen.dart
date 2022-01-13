import 'package:flutter/material.dart';
import 'package:tebiyancode/home_screen_column.dart';


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
            icon: const Text('pagecolumn'
            ), 
          // ignore: avoid_print
          onPressed: () { _navigateToNextcolumn(context);},
          ),
        ],
        
      ),
      // ignore: avoid_unnecessary_containers
      // ignore: prefer_const_literals_to_create_immutables, sized_box_for_whitespace
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(20.0),
              topEnd: Radius.circular(20.0),
              ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
            const Image(image: NetworkImage(
              'https://www.muhtwa.com/wp-content/uploads/صور-ورد141.jpg',
            ),
            height: 200.0,
            width: 300.0,
            fit: BoxFit.contain,
            ),
            Container(
              color: Colors.black.withOpacity(0.5),
              width: 300.0,
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
            
              ),
              child: const Text(
                'flower',
                textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
              ),
            )
          ]),
        ),
      ) ,
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


