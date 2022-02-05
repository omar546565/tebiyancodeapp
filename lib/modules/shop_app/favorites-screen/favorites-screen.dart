import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/shop_app/cubit/cubit.dart';
import '../../../layout/shop_app/cubit/states.dart';
import '../../../shared/companents/companents.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context);
      return BlocConsumer<ShopCubit,ShopStates>(
      listener:(context,state){} ,
      builder: (context,state){
        return cubit.favoritesModel!.products!.length == 0 ? Center(child: Text('لايوجد منتجات في المفضلة',style: TextStyle(fontSize: 24.0,),)) : ListView.separated(
          itemBuilder: (context,index)=> Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 120.0,
              child: Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Image(
                        image: NetworkImage(cubit.favoritesModel!.products![index].image.toString(),),
                        width: 120.0,
                        height: 200.0,
                        fit: BoxFit.contain,
                      ),
                      if(1 != 0)
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
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          cubit.favoritesModel!.products![index].name.toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            height: 1.3,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow:TextOverflow.ellipsis ,

                        ),
                        Spacer(),
                        Row(
                            children:[
                              Text(
                                '${cubit.favoritesModel!.products![index].price.toString()}tl',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              SizedBox(width:10.0 ,),
                              if(1 != 0)
                                Text(
                                  '${cubit.favoritesModel!.products![index].oldPrice.toString()}tl',
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

                                  cubit.changeFavorites(cubit.favoritesModel!.products![index].id!.round());
                                },
                                icon: CircleAvatar(
                                  radius: 15.0,
                                  backgroundColor:cubit.favorites[cubit.favoritesModel!.products![index].id] == 'true'  ? Colors.deepOrange  : Colors.grey  ,
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
          separatorBuilder: (context,index)=>myDivider(),
          itemCount: cubit.favoritesModel!.products!.length,
        );
      },
    );


  }
}
