import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/styles/colors.dart';

class BoardignModel
{
  late final String image;
  late final String title;
  late final String body;

  BoardignModel({
    required this.image,
    required this.title,
    required this.body,
  });

}




class OnBoardingScreen extends StatelessWidget {
  var boardController = PageController();

  List<BoardignModel> boarding = [
    BoardignModel( image:'assets/images/onboard_1.jpg',
      title: 'onboard_1 title',
      body: 'onboard_1 body',),
    BoardignModel( image:'assets/images/onboard_2.jpg',
      title: 'onboard_2 title',
      body: 'onboard_2 body',),
    BoardignModel( image:'assets/images/onboard_3.jpg',
      title: 'onboard_3 title',
      body: 'onboard_3 body',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
                child:
                PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: boardController,
                  itemBuilder:(context,index)=>buildBoardingItem(boarding[index]),
                  itemCount: 3,
                ),

                ),
            ),
            SizedBox(height: 40.0,),
            Row(
               children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect:ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                    dotHeight:10.0,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                  count: boarding.length,
                ),
                 Spacer(),
                 FloatingActionButton(onPressed: ()
                 {
                   boardController.nextPage(
                       duration: Duration(
                         milliseconds: 750,
                       ),
                       curve: Curves.fastLinearToSlowEaseIn,
                   );
                 },
                 child: Icon(Icons.arrow_forward_ios),
                 ),
               ],
            ),
          ],
        ),
      ),
    );
  }
  Widget buildBoardingItem(BoardignModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(height: 20.0,),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
      SizedBox(height: 15.0,),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
      SizedBox(height: 15.0,),
    ],
  );
}
