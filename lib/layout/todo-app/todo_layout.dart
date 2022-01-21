import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tebiyancode/shared/companents/companents.dart';
import 'package:tebiyancode/shared/cubit/cubit.dart';
import 'package:tebiyancode/shared/cubit/states.dart';

import '../../modules/archive_tasks/archive_tasks_screen.dart';
import '../../modules/done_tasks/done_tasks_screen.dart';
import '../../modules/new_tasks/new_tasks_screen.dart';
import '../../shared/companents/constants.dart';

//1.create database
//2.create tables
//3.open database
//4.insert to database
//5.get from database
//6.update in database
//7.delete from database



class HomeLayout extends StatelessWidget
{

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();






  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context)=> AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state){
          if(state is AppgInsertDatabaseState){
            Navigator.pop(context);
          }
        } ,
        builder: (BuildContext context, AppStates state)
        {
          AppCubit cubit =  AppCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            body: state is  AppgGetDatabaselogingState? Center(child: CircularProgressIndicator()) : cubit.screens[cubit.currentIndex] ,
            floatingActionButton: FloatingActionButton(
              onPressed: () async
              {
                if(cubit.isBottomSheetShown){
                  if(formKey.currentState!.validate())
                  {
                    cubit.insertToDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text,
                    );
                    this.titleController.text ='';
                    this.timeController.text ='';
                    this.dateController.text ='';

                   /* insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,
                    ).then((value) {

                      getDataFromDatabase(database).then((value)
                      {

                        Navigator.pop(context);

                        *//* setState(() {
                        isBottomSheetShown =false;
                        fabIcon = Icons.edit;
                        tasks = value;
                      });*//*
                      });
                    });*/
                  }
                }else{
                  scaffoldKey.currentState!.showBottomSheet(
                        (context) => Container(
                      color: Colors.grey[100],
                      padding: EdgeInsets.all(20.0,),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min ,
                            children: [
                              defaultFormField(
                                controller: titleController,
                                type: TextInputType.text,
                                label: 'Task Title',
                                prefix: Icons.title,
                                onTap: (){
                                  print('timing tapped');
                                },
                                validate:  (value){
                                  if(value!.isEmpty){
                                    return 'title must not be empty';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height:15.0 ,
                              ),
                              defaultFormField(
                                controller: timeController,
                                type: TextInputType.datetime,

                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    timeController.text = value!.format(context).toString();

                                  });
                                },
                                validate:  (value){
                                  if(value!.isEmpty){
                                    return 'time must not be empty';
                                  }
                                  return null;
                                },
                                label: 'Task time',
                                prefix: Icons.watch_later_outlined,
                              ),
                              SizedBox(
                                height:15.0 ,
                              ),
                              defaultFormField(
                                controller: dateController,
                                type: TextInputType.datetime,

                                onTap: (){
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2022-02-01'),
                                  ).then((value) {
                                    dateController.text = DateFormat.yMMMd().format(value!) as String;

                                  });
                                },
                                validate:  (value){
                                  if(value!.isEmpty){
                                    return 'date must not be empty';
                                  }
                                  return null;
                                },
                                label: 'Task date',
                                prefix: Icons.calendar_today,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    elevation: 20.0,
                  ).closed.then((value) {
                    cubit.changeBottomSheetState(isShow: false, icon: Icons.edit,);

                  });
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add,);

                }



                //   try{var name = await
                //  getName();
                //  print(name);
                //   throw('some error !!!!!!!!');}          // catch(error){print('error${error.toString()}');}
                //  getName().then((value){print(value);print('osama');// throw('!!! أنا عملت إيروور');
                //  }).catchError((error){print('error${error.toString()}');});

              },
              child: Icon(

                cubit.fabIcon,
              ),
            ) ,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex:  cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeIndex(index);

              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks' ,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done' ,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archive' ,
                ),
              ],
            ),
          );
        } ,
      ),
    );
  }

//Instance of 'Future<String>'

  Future<String> getName() async
  {
    return 'Ahmed Ali';
  }





}





