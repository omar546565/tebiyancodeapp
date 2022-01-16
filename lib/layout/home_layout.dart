import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../modules/archive_tasks/archive_tasks_screen.dart';
import '../modules/done_tasks/done_tasks_screen.dart';
import '../modules/new_tasks/new_tasks_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

//1.create database
//2.create tables
//3.open database
//4.insert to database
//5.get from database
//6.update in database
//7.delete from database


class _HomeLayoutState extends State<HomeLayout>
{
  int currentIndex = 0 ;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen(),
  ];
  List<String> titles = [
   'Tasks' ,
   'Done' ,
   'Archive' ,
  ];

  @override
  void initState() {
    super.initState();
    createDatabase();
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
        ),
      ),
      body: screens[currentIndex] ,
      floatingActionButton: FloatingActionButton(
        onPressed: () async
        {
          try{var name = await
          getName();
          print(name);
       //   throw('some error !!!!!!!!');
          }
          catch(error)
          {
            print('error${error.toString()}');
          }

        //  getName().then((value){print(value);print('osama');// throw('!!! أنا عملت إيروور');
        //  }).catchError((error){print('error${error.toString()}');});

        },
        child: Icon(
          Icons.add,
        ),
      ) ,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index ;
          });

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
  }

//Instance of 'Future<String>'

  Future<String> getName() async
  {
    return 'Ahmed Ali';
  }

  void createDatabase() async
  {
   var database = await openDatabase(
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
         print('database Opened');
       },

   );
  }
  void insertToDatabase()
  {

  }
}
