import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tebiyancode/bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen>
{
  bool isMale = true;
  double height =120;
  int wieght = 40;
  int age = 20;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
       appBar: AppBar(
         title: const Text(
           'Bmi Calculator',
         ),
       ),
      body: Column(
        children: [
          Expanded(child:
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale= true;
                      });

                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                             image: AssetImage('assets/images/male.jpg'),
                             height:90.0,
                             width: 90.0,
                         ),
                          SizedBox(height: 15.0,),
                          Text(
                            'Male',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: isMale ?  Colors.blue : Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20.0,),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale= false;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                            image: AssetImage('assets/images/Female.png'),
                            height:90.0,
                            width: 90.0,
                          ),
                          SizedBox(height: 15.0,),
                          Text(
                            'famale',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: !isMale ?  Colors.blue : Colors.grey[400],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(child:
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'height',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic ,
                    children:  [
                      Text(
                        '${height.round()}',
                        style: const TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(width: 20.0,),
                      const Text(
                        'CM',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                      value: height,
                      max: 220.0,
                      min: 80.0,
                      onChanged: (value){
                        setState(() {
                          height= value ;
                        });

                      },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0,),
                color: Colors.grey[400],
              ),
            ),
          ),
          ),
          Expanded(
            child:
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
             children: [
               Expanded(
                 child: Container(
                   child: Column(
                     mainAxisAlignment:MainAxisAlignment.center ,
                     children: [
                       const Text(
                         'wieght',
                         style: TextStyle(
                           fontSize: 25.0,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                        Text(
                         '$wieght',
                         style: const TextStyle(
                           fontSize: 40.0,
                           fontWeight: FontWeight.w900,
                         ),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           FloatingActionButton(
                             onPressed: (){
                               setState(() {
                                 wieght--;
                               });
                             },
                             heroTag: 'wieght-',
                             mini: true,
                             child: const Icon(
                               Icons.remove,
                             ),
                           ),
                           FloatingActionButton(
                             onPressed: (){
                               setState(() {
                                 wieght++;
                               });
                             },
                             heroTag: 'wieght+',
                             mini: true,
                             child: const Icon(
                               Icons.add,
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10.0),
                     color: Colors.grey[400],
                   ),
                 ),
               ),
               const SizedBox(width: 20.0,),
               Expanded(
                 child: Container(
                   child: Column(
                     mainAxisAlignment:MainAxisAlignment.center ,
                     children: [
                       const Text(
                         'Age',
                         style: TextStyle(
                           fontSize: 25.0,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                        Text(
                         '$age',
                         style: const TextStyle(
                           fontSize: 40.0,
                           fontWeight: FontWeight.w900,
                         ),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           FloatingActionButton(
                             onPressed: (){
                               setState(() {
                                 age--;
                               });
                             },
                             heroTag: 'age-',
                             mini: true,
                             child: const Icon(
                               Icons.remove,
                             ),
                           ),
                           FloatingActionButton(
                             onPressed: (){
                               setState(() {
                                 age++;
                               });
                             },
                             heroTag: 'age+',
                             mini: true,
                             child: const Icon(
                               Icons.add,
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10.0),
                     color: Colors.grey[400],
                   ),
                 ),
               ),
             ],
             ),
          ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
              onPressed: (){
                double result = wieght / pow(height/100,2);
                print(result.round());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(context)=> BmiResultScreen(
                      age: age,
                      result: result.round(),
                      isMale: isMale,
                    ),
                  )
                  ,);
                
              },
              child:const Text(
                'Calculate',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

 // var result = wieght / pow(height/100,2);
 // print(result.round());
}
