import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/shop_app/cubit/cubit.dart';
import 'package:tebiyancode/layout/shop_app/cubit/states.dart';
import 'package:tebiyancode/shared/companents/companents.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener:(context,state){} ,
      builder: (context,state){
      return  ListView.separated(
          itemBuilder: (context,index)=>Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Image(
                  image: NetworkImage(ShopCubit.get(context).categoriesModel!.data.data[index].image.toString(),),
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 20.0,),
                Text(
                  '${ShopCubit.get(context).categoriesModel!.data.data[index].name}',
                  style: TextStyle(
                    fontSize:20.0 ,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                ),

              ],
            ),
          ),
          separatorBuilder: (context,index)=>myDivider(),
          itemCount: ShopCubit.get(context).categoriesModel!.data.data.length,
        );
      },
    );
  }
}
