import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:reminder_app/theme.dart';
import 'package:reminder_app/ui/widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Container(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add Task",
            style: headingStyle,),
            MyInputField(title: 'Title', hint: 'Enter Title',),
            MyInputField(title: 'Note', hint: 'Enter your note',),
            MyInputField(title: 'Date', hint: DateFormat.yMd().format(_selectedDate),
            widget: IconButton( icon: Icon(Icons.calendar_month_outlined),
              onPressed: () {

              },),)



          ],
        ),),
      ),
    );
  }
}
//workflow check
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