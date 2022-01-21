import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebiyancode/shared/companents/companents.dart';
import 'package:tebiyancode/shared/cubit/cubit.dart';

import '../../shared/companents/constants.dart';
import '../../shared/cubit/states.dart';

class NewTasksScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){

      },
      builder: (context, state)
      {
        var tasks = AppCubit.get(context).newTasks;
     return ListView.separated(
      itemBuilder: (context, index)=> buildTasksItem(tasks[index], context),
      separatorBuilder: (context, index)=>myDivider(),
  itemCount: tasks.length,

);
      },
    );
  }
}
