import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tebiyancode/shared/cubit/states.dart';

import '../../modules/archive_tasks/archive_tasks_screen.dart';
import '../../modules/done_tasks/done_tasks_screen.dart';
import '../../modules/new_tasks/new_tasks_screen.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;
  List<Widget> screens =
  [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen(),
  ];
  List<String> titles =
  [
    'Tasks' ,
    'Done' ,
    'Archive' ,
  ];


  void changeIndex(int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNavigationBarState());
  }
  late Database database;
  List<Map> newTasks =[];
  List<Map> doneTasks =[];
  List<Map> archivedTasks =[];

 void createDatabase()
   {
   openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version)
      {
        print('database Created');
        database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,data TEXT,time TEXT,status TEXT )').then((value){

        }).catchError((onError){
          print('onError when creating table ${onError.toString()}');
        });
      },
      onOpen: (database)
      {
        getDataFromDatabase(database);
        print('database Opened');
      },
    ).then((value)  {
      database = value;
      emit(AppCreateDatabaseState());

    });
  }


  void getDataFromDatabase(database)
  {
    newTasks =[];
    doneTasks =[];
    archivedTasks =[];

    emit(AppgGetDatabaselogingState());
    
       database.rawQuery('SELECT * FROM tasks').then((value)
       {


         value.forEach((element) {
          if(element['status'] == 'NEW')
            newTasks.add(element);
          else if(element['status'] == 'done')
            doneTasks.add(element);
          else archivedTasks.add(element);
         });

         emit(AppgGetDatabaseState());
       });

  }

   insertToDatabase({
    required String title,
    required String time,
    required String date,
  })async
  {
     await database.transaction((txn)async
    {
      txn.rawInsert(
          'INSERT INTO tasks(title,time,data,status) VALUES("$title","$time","$date","NEW")'
      ).then((value) {
        print('$value insert successfully');
        emit(AppgInsertDatabaseState());
        getDataFromDatabase(database);
        
      }).catchError((error){
        print('onError when insert value ${error.toString()}');
      });
      return null;
    });
  }

  void  updateData({
  required String status,
  required int id,
}) async
  {
     database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]
     ).then((value) {
          getDataFromDatabase(database);
          emit(AppUpdateDatabaseState());
     });

  }

  void deleteData({
  required int id,
}) async
  {
     database.rawDelete(
        'DELETE FROM tasks  WHERE id = ?', [id]
     ).then((value) {
          getDataFromDatabase(database);
          emit(AppDeleteDatabaseState());
     });

  }


  bool isBottomSheetShown =false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
  required bool isShow,
  required IconData icon,


})
  {
    isBottomSheetShown= isShow;
    fabIcon = icon;
    
    emit(AppChangeBottomSheetState());
  }

  bool isDark = false;


  void changeAppMode()
  {
    isDark = !isDark;
    emit(AppChangeModeState());
  }

}