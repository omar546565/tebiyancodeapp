import 'package:flutter/material.dart';
import 'package:tebiyancode/shared/companents/companents.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 5.0,
        title: Text('تعديل البيانات',),
        actions: [
          defaultTextButton(function: (){}, text: 'تحديث'),
          SizedBox(width: 15.0,),
        ],
      ),
    );
  }
}
