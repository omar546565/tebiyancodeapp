import 'package:flutter/material.dart';

class UserModel {
  final int id;
  final String name;
  final String phone;
  UserModel({
   required this.id,
   required this.name,
   required  this.phone,
});
}


class UsersScreen extends StatelessWidget {


  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'omar alhasan',
      phone: '+785554563',
    ),
    UserModel(
      id: 2,
      name: 'hasa alhasan',
      phone: '+785563',
    ),
    UserModel(
      id: 3,
      name: 'kdf alhasan',
      phone: '+785665563',
    ),
    UserModel(
      id: 1,
      name: 'omar alhasan',
      phone: '+785554563',
    ),
    UserModel(
      id: 2,
      name: 'hasa alhasan',
      phone: '+785563',
    ),
    UserModel(
      id: 3,
      name: 'kdf alhasan',
      phone: '+785665563',
    ),
    UserModel(
      id: 1,
      name: 'omar alhasan',
      phone: '+785554563',
    ),
    UserModel(
      id: 2,
      name: 'hasa alhasan',
      phone: '+785563',
    ),
    UserModel(
      id: 3,
      name: 'kdf alhasan',
      phone: '+785665563',
    ),
    UserModel(
      id: 1,
      name: 'omar alhasan',
      phone: '+785554563',
    ),
    UserModel(
      id: 2,
      name: 'hasa alhasan',
      phone: '+785563',
    ),
    UserModel(
      id: 3,
      name: 'kdf alhasan',
      phone: '+785665563',
    ),

  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
     appBar: AppBar(
       title:const Text(
         'Users',
       ) ,
     ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUsersItem(users[index]),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              width:double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length,
      ) ,
    );
  }


  Widget buildUsersItem(UserModel user)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:  [
         CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 25.0,),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user.phone,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.grey,

              ),
            ),
          ],
        ),
      ],
    ),
  );
//1.build item
//2.build list
//3.add item to list


}
