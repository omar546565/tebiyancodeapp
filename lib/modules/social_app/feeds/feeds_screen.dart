import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tebiyancode/shared/companents/companents.dart';
import 'package:tebiyancode/shared/styles/colors.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics() ,
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer ,
              elevation: 10.0,
              margin: EdgeInsets.all(8.0,),
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Image(
                    image: NetworkImage('https://img.freepik.com/free-vector/realistic-ramadan-greeting-card-template_52683-82243.jpg?w=1380') ,
                    fit: BoxFit.cover,
                    height: 200.0,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('اتصل مع أصدقائك',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => buildPostItem(context),
              separatorBuilder: (context, index) => SizedBox( height: 8.0, ) ,
              itemCount: 10,
            ),
            SizedBox(height: 10.0,),
            
           ],
        ),
      ),
    );
  }
  Widget buildPostItem(context) => 
      Card(
        clipBehavior: Clip.antiAliasWithSaveLayer ,
        elevation: 5.0,
        margin: EdgeInsets.symmetric(
                horizontal: 8.0,
                ),
        child:  Padding(
                  padding: const EdgeInsets.all(10.0),
                      child: Column(
                          children: [
                                Row(
                                children: [
                                CircleAvatar(
                                radius: 25.0,
                                backgroundImage: NetworkImage('https://www.itkan.online/profile/text/1596992271.png'),
                                ),
                                SizedBox(
                                width: 15.0,
                                ),
                                Expanded(
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Row(
                                children: [
                                Text('عمر الحسن',
                                style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                height: 1.4,
                                ),
                                ),
                                SizedBox(
                                width: 5.0,
                                ),
                                Icon(
                                Icons.check_circle,
                                color: defaultColor,
                                size: 20.0,
                                ),
                                ],
                                ),
                                Text('مارس 2022/03/05',
                                style:Theme.of(context).textTheme.caption?.copyWith(
                                height: 1.4,
                                ) ,
                                ),
                                ],
                                ),
                                ),
                                SizedBox(
                                width: 15.0,
                                ),
                                IconButton(
                                onPressed: (){},
                                icon: Icon(
                                Icons.more_horiz,
                                size: 20.0,
                                ),
                                ),
                                ],
                                ),
                                Padding(
                                padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                ),
                                child: Container(
                                width: double.infinity,
                                height: 1.0,
                                color: Colors.grey[300] ,
                                ),
                                ),
                                Text(
                                ' هذا الموضع يجب أن يذكر كاتب المقال الاجتماعي أمثلةً تخصُّ القضية المطروحة قد عاش فيها الناس في المجتمع وأفراد المجتمع بالفعل بحاجةٍ إلى حل لهذه المشكلة، وفي حقيقة أغلب القضايا الاجتماعية المطروحة هي في الأساس مشكلة تواجه أفراد المجتمع ويبحثون عن حلولٍ لها.',
                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                height: 1.5,
                                ),
                                ),
                                Padding(
                                padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                ),
                                child: Container(
                                width: double.infinity,
                                child: Wrap(
                                children: [
                                Padding(
                                padding: const EdgeInsets.only(
                                right: 6.0,
                                ),
                                child: Container(
                                height: 25.0,
                                child: MaterialButton(
                                onPressed: (){},
                                minWidth: 1.0,
                                padding: EdgeInsets.zero,
                                child: Text(
                                '#رمضان كريم',
                                style:Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.orange,
                                ),
                                ),
                                ),
                                ),
                                ),
                                Padding(
                                padding: const EdgeInsets.only(
                                right: 6.0,
                                ),
                                child: Container(
                                height: 25.0,
                                child: MaterialButton(
                                onPressed: (){},
                                minWidth: 1.0,
                                padding: EdgeInsets.zero,
                                child: Text(
                                '#رمضان كريم',
                                style:Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.orange,
                                ),
                                ),
                                ),
                                ),
                                ),
                                ],
                                ),
                                ),
                                ),
                                Container(
                                height: 150.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0) ,
                                image: DecorationImage(
                                image: NetworkImage('https://img.freepik.com/free-vector/realistic-ramadan-greeting-card-template_52683-82243.jpg?w=1380') ,
                                fit: BoxFit.cover,
                              
                                ),
                                ) ,
                              
                                ),
                                Padding(
                                padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                ),
                                child: Row(
                                children: [
                                Expanded(
                                child: InkWell(
                                child: Padding(
                                padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                ),
                                child: Row(
                                children: [
                                Icon(
                                Icons.favorite,
                                size: 18.0,
                                color: Colors.deepOrange,
                                ),
                                Text(
                                '120',
                                style: Theme.of(context).textTheme.caption,
                                ),
                                ],
                                ),
                                ),
                                onTap:(){},
                                ),
                                ),
                                Expanded(
                                child: InkWell(
                                child: Padding(
                                padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                ),
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                Icon(
                                Icons.chat,
                                size: 18.0,
                                color: Colors.amber,
                                ),
                                Text(
                                '120 تعليق',
                                style: Theme.of(context).textTheme.caption,
                                ),
                                ],
                                ),
                                ),
                                onTap:(){},
                                ),
                                ),
                                ],
                                ),
                                ),
                                Padding(
                                padding: const EdgeInsets.only(
                                bottom: 10.0,
                                ),
                                child: Container(
                                width: double.infinity,
                                height: 1.0,
                                color: Colors.grey[300] ,
                                ),
                                ),
                                Row(
                                children: [
                                Expanded(
                                child: InkWell(
                                child: Row(
                                children: [
                                CircleAvatar(
                                radius: 18.0,
                                backgroundImage: NetworkImage('https://www.itkan.online/profile/text/1596992271.png'),
                                ),
                                SizedBox(
                                width: 15.0,
                                ),
                                Text('اكتب تعليق......',
                                style:Theme.of(context).textTheme.caption?.copyWith(
                                height: 1.4,
                                ) ,
                                ),
                                ],
                                ),
                                onTap: (){},
                                ),
                                ),
                                InkWell(
                                child: Row(
                                children: [
                                Icon(
                                Icons.favorite,
                                size: 18.0,
                                color: Colors.grey,
                                ),
                                Text(
                                'إعجاب',
                                style: Theme.of(context).textTheme.caption,
                                ),
                                ],
                                ),
                                onTap:(){},
                                ),
                                ],
                                ),
                           ],
                      ),
                  ),
      );
}
