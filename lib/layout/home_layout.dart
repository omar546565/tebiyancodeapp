import 'package:flutter/material.dart';

import '../modules/archive_tasks/archive_tasks_screen.dart';
import '../modules/done_tasks/done_tasks_screen.dart';
import '../modules/new_tasks/new_tasks_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

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
}
