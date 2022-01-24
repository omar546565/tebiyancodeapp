import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/layout/news_app/cubit/cubit.dart';
import 'package:tebiyancode/layout/news_app/cubit/states.dart';
import 'package:tebiyancode/shared/companents/companents.dart';

class SearchScreen extends StatelessWidget {

  final searchController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(

      listener: (context, state){},
      builder: (context,state){
        var list = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children:
              [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    onChange: (String value){
                     NewsCubit.get(context).getSearch(value);
                    },
                    label: 'search',
                    prefix: Icons.search,
                    validate: (value)
                    {
                      if(value!.isEmpty){
                        return 'search must not be empty';
                      }
                      return null;
                    },
                  ),
                ),

                Expanded(
                  child:   list.length == 0  ? Center(child: Text('ابحث هنا',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.orange,),),) : ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder:  (context, index) => bulidArticleItem(list[index], context),
                      separatorBuilder: (context, index) =>myDivider(),
                      itemCount: list.length,
        ),
                ),
              ],
            ),
          );
      },
    );
  }
}
