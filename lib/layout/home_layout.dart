import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tebiyancode/shared/companents/companents.dart';

import '../modules/archive_tasks/archive_tasks_screen.dart';
import '../modules/done_tasks/done_tasks_screen.dart';
import '../modules/new_tasks/new_tasks_screen.dart';
import '../shared/companents/constants.dart';

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

  late Database database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShown =false;
  IconData fabIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();



  @override
  void initState() {
    super.initState();
    createDatabase();
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
        ),
      ),
      body: tasks.length == 0 ? Center(child: CircularProgressIndicator()) : screens[currentIndex] ,
      floatingActionButton: FloatingActionButton(
        onPressed: () async
        {
          if(isBottomSheetShown){
            if(formKey.currentState!.validate())
            {
              insertToDatabase(
                title: titleController.text,
                time: timeController.text,
                date: dateController.text,
              ).then((value) {

                getDataFromDatabase(database).then((value)
                {

                  Navigator.pop(context);

                  setState(() {
                    isBottomSheetShown =false;
                    fabIcon = Icons.edit;
                    tasks = value;
                  });
                });
              });
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
              isBottomSheetShown =false;
              setState(() {
                fabIcon = Icons.edit;
              });
            });
            isBottomSheetShown =true;
            setState(() {
              fabIcon = Icons.add;
            });
          }



          //   try{var name = await
        //  getName();
        //  print(name);
       //   throw('some error !!!!!!!!');}          // catch(error){print('error${error.toString()}');}
        //  getName().then((value){print(value);print('osama');// throw('!!! أنا عملت إيروور');
        //  }).catchError((error){print('error${error.toString()}');});

        },
        child: Icon(
          fabIcon,
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
     database = await openDatabase(
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
          getDataFromDatabase(database).then((value)
          {
            setState(() {
              tasks = value;
            });


          });
         print('database Opened');
       },
   );
  }


  Future<List<Map>> getDataFromDatabase(database) async
  {
 return   await  database.rawQuery('SELECT * FROM tasks');

  }

  Future insertToDatabase({
    required String title,
    required String time,
    required String date,
  })async
  {
  return await database.transaction((txn)async
    {
      txn.rawInsert(
          'INSERT INTO tasks(title,time,data,status) VALUES("$title","$time","$date","NEW")'
      ).then((value) {
         print('$value insert successfully');
      }).catchError((error){
        print('onError when insert value ${error.toString()}');
      });
      return null;
    });
  }



}
