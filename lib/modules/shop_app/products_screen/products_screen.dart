import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/shop_app/cubit/cubit.dart';
import 'package:tebiyancode/layout/shop_app/cubit/states.dart';
import 'package:tebiyancode/shared/companents/companents.dart';


class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state){
          if( state is  ShopSuccessChangeFavoritesState)
          {
              if(cubit.changeFavoritesModel!.status)
                {
                  if(cubit.changeFavoritesModel!.update.toString() == '1' ){
                    showToast(
                      text: cubit.changeFavoritesModel!.message.toString(),
                      state: ToastStates.SUCCESS,
                    );
                  }else{
                    showToast(
                      text: cubit.changeFavoritesModel!.message.toString(),
                      state: ToastStates.ERROR,
                    );
                  }


                }else{
                showToast(
                  text: 'هناك خطأ بالاتصال',
                  state: ToastStates.ERROR,);
              }
          }
        },
        builder: (context, state){
          return cubit.homeModel  != null &&  cubit.categoriesModel  != null? SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                CarouselSlider
                  (
                  items: cubit.homeModel!.data.banners.map((e) =>Image(
                    image: NetworkImage('${e.image}'),
                    width: double.infinity,
                    fit: BoxFit.cover,
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
                ),
                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Container(
                        height: 100.0,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics() ,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              Stack(
                                alignment: AlignmentDirectional.bottomCenter,
                                children:
                                [
                                  Image(
                                    image:NetworkImage(cubit.categoriesModel!.data.data[index].image.toString()),
                                    width:100.0,
                                    height:100.0 ,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    color: Colors.black.withOpacity(0.8,),
                                    width: 100.0,
                                    child: Text(
                                      '${cubit.categoriesModel!.data.data[index].name.toString()}',
                                      textAlign: TextAlign.center ,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis ,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          separatorBuilder: (context, index)=> SizedBox(width: 10.0,),
                          itemCount: cubit.categoriesModel!.data.data.length,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        'New Products',
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  color: Colors.grey[300],
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing:1.0 ,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 1/1.55,
                    children:List.generate(
                      cubit.homeModel!.data.products.length,
                          (index) => Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                Image(
                                  image: NetworkImage('${cubit.homeModel!.data.products[index].image}'),
                                  width: double.infinity,
                                  height: 200.0,
                                  fit: BoxFit.contain,
                                ),
                                if(cubit.homeModel!.data.products[index].discount != 0)
                                  Container(
                                    color: Colors.red,
                                    padding: EdgeInsets.symmetric(horizontal: 5.0,) ,
                                    child: Text(
                                      'Discount',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Text(
                                    cubit.homeModel!.data.products[index].name,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      height: 1.3,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow:TextOverflow.ellipsis ,

                                  ),
                                  Row(
                                      children:[
                                        Text(
                                          '${cubit.homeModel!.data.products[index].price.round()} tl',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepOrange,
                                          ),
                                        ),
                                        SizedBox(width:10.0 ,),
                                        if(cubit.homeModel!.data.products[index].discount != 0)
                                          Text(
                                            '${cubit.homeModel!.data.products[index].oldPrice} tl',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              decoration: TextDecoration.lineThrough,
                                            ),
                                          ),
                                        Spacer(),
                                        IconButton(
                                          onPressed: (){
                                            cubit.changeFavorites(cubit.homeModel!.data.products[index].id);

                                          },
                                          icon: CircleAvatar(
                                            radius: 15.0,
                                            backgroundColor: cubit.favorites[cubit.homeModel!.data.products[index].id] == 'true'  ? Colors.deepOrange  : Colors.grey  ,
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],),
          ) : Center(child: CircularProgressIndicator()) ;

        },
    );
  }




}
