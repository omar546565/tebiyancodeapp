import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/shop_app/cubit/cubit.dart';
import 'package:tebiyancode/layout/shop_app/cubit/states.dart';


class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state){},
        builder: (context, state){
          return ShopCubit.get(context).homeModel  == null  ? Center(child: CircularProgressIndicator()) : CarouselSlider(
              items: ShopCubit.get(context).homeModel!.data.banners.map((e) =>Image(
                  image: NetworkImage('${e.image}')
              ),).toList(),
              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                viewportFraction:1.0 ,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,

              ),
          );
        },
    );
  }




}
