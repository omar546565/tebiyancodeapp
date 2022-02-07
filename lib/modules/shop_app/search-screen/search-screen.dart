import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/shop_app/cubit/cubit.dart';
import 'package:tebiyancode/modules/shop_app/search-screen/cubit/cubit.dart';
import 'package:tebiyancode/modules/shop_app/search-screen/cubit/states.dart';
import 'package:tebiyancode/shared/companents/companents.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();

    return  Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (BuildContext context)=>ShopSearchCubit(),
        child: BlocConsumer<ShopSearchCubit,ShopSearchStates>(
          listener: (context,state){},
          builder: (context,state){
            return Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      label: 'search',
                      prefix: Icons.print,
                      onChange:(String text){
                        ShopSearchCubit.get(context).search(text);
                      } ,
                      onFieldSubmit: (String text){
                              ShopSearchCubit.get(context).search(text);
                      },
                      validate:(value){
                        if(value.isEmpty)
                        {
                          return 'enter text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.0,),
                    if(state is ShopSearchLoadingState)
                    LinearProgressIndicator(),
                    SizedBox(height: 10.0,),
                    state  is ShopSearchSuccessState ? Expanded(
                      child: ListView.separated(
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
                                      image: NetworkImage(ShopSearchCubit.get(context).srearchModel!.products![index].image.toString(),),
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
                                        ShopSearchCubit.get(context).srearchModel!.products![index].name.toString(),
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
                                              '${ShopSearchCubit.get(context).srearchModel!.products![index].price}tl',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.deepOrange,
                                              ),
                                            ),
                                            SizedBox(width:10.0 ,),
                                            if(1 != 0)
                                              Text(
                                                '${ShopSearchCubit.get(context).srearchModel!.products![index].oldPrice}tl',
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

                                              },
                                              icon: CircleAvatar(
                                                radius: 15.0,
                                                backgroundColor:Colors.deepOrange    ,
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
                        itemCount: ShopSearchCubit.get(context).srearchModel!.products!.length,
                      ),
                    ): Center(child: Text('لايوجد منتجات في المفضلة',style: TextStyle(fontSize: 24.0,),)) ,
                  ],
                ),
              ),
            );
          } ,

        ),
      ) ,

      );


  }
}
