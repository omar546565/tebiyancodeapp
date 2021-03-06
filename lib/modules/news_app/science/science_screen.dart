import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/news_app/cubit/cubit.dart';
import '../../../layout/news_app/cubit/states.dart';
import '../../../shared/companents/companents.dart';


class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener:  (context, state){

      },
      builder: (context, state){

        var list = NewsCubit.get(context).science;

        return list.length == 0 ? Center(child: CircularProgressIndicator()) : ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => bulidArticleItem(list[index],context),
          separatorBuilder: (context, index) =>myDivider(),
          itemCount: list.length,
        );
      },

    );
  }
}
