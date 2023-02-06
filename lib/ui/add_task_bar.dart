import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reminder_app/theme.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: SingleChildScrollView(
        padding:const EdgeInsets.only(left: 20,right: 20),
        child: Container(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add Task",
            style: headingStyle,),
            Container(
              height: 52,
              color: Colors.grey,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextFormField(
                        autofocus: false
                  ))
                ],
              ),
            ),

          ],
        ),),
      ),
    );
  }
}

_appBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: context.theme.backgroundColor,
    leading: GestureDetector(
      onTap: (){
        Get.back();
      },
      child:Icon(Icons.arrow_back_ios,
        size: 20,
        color:Get.isDarkMode?Colors.white:Colors.black,),
    ),
    actions: const [
      CircleAvatar(
        backgroundImage: AssetImage("images/vit.png"),
      ),
      SizedBox(width: 20,)
    ],
  );
}