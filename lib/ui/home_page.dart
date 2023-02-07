// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:reminder_app/services/theme_services.dart';
import 'package:reminder_app/services/notification_services.dart';
import 'package:reminder_app/theme.dart';
import 'package:reminder_app/ui/add_task_bar.dart';
import 'package:reminder_app/ui/widgets/button.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// style =Get.isDarkMode?'Dark theme applied: Light theme applied'

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  NotifyHelper notificationServices = NotifyHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotifyHelper.initialize(flutterLocalNotificationsPlugin);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          _showTasks(),

        ],
      ),
    );
  }

  _showTasks(){
    return Expanded(
        child: Obx((){
          return ListView.builder(
              itemBuilder: (_,context){
              return null;
          });
        }),
    );
  }
  _addDateBar(){
    return Container(
      margin: const EdgeInsets.only( top: 20,left: 10),
      child: DatePicker(
        DateTime.now(),
        width: 80,
        height: 100,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
            textStyle:TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            )
        ),
        dayTextStyle: GoogleFonts.lato(
            textStyle:TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            )
        ),
        monthTextStyle: GoogleFonts.lato(
            textStyle:TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            )
        ),

        onDateChange: (date) {
          // New date selected
          _selectedDate = date;
          setState(() {
          });
        },

      ),
    );
  }

  _addTaskBar(){
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text("Today",
                  style: headingStyle,)
              ],
            ),
          ),
          MyButton(label: "+ Add Task", onTap: () =>Get.to(() => AddTaskPage()), ),
        ],),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: (){
          notificationServices.sendNotification(title: 'Theme changed',body:Get.isDarkMode?'Theme changed to light':'theme changed to dark', fln: flutterLocalNotificationsPlugin, );
          ThemeServices().switchTheme();
        print('Theme Button Tapped');
        },
        child:Icon(Get.isDarkMode?
            Icons.wb_sunny_outlined:Icons.nightlight_round,
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
}
