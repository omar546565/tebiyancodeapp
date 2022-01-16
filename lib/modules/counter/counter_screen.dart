import 'package:flutter/material.dart';

class   counterScreen extends StatefulWidget {


  @override
  State<counterScreen> createState() => _counterScreenState();
}

class _counterScreenState extends State<counterScreen> {
  int counter = 1 ;

  //1.constructor
  //2.init state
  //3.build

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://img.lovepik.com/free-png/20210918/lovepik-character-png-image_400195163_wh1200.png'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'counter',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 25.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 25.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: (){
                setState(() {
                  counter-- ;
                  print(counter);
                });

              },
              child: const Text(
                'MINus',
              ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Text('$counter',
            style: const TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.w900,
            ),
            ),
          ),
          TextButton(
            onPressed: (){
              setState(() {
                counter++ ;
                print(counter);
              });

            },
            child: const Text(
              'PLUS',
            ),
          ),
        ],
      ) ,
    );
  }
}
