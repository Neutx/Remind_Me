import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:reminder_app/services/services.dart';
import 'package:reminder_app/services/notification_services.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// style =Get.isDarkMode?'Dark theme applied: Light theme applied'

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        children: const [
          Text(
            'Theme Data',
            style: TextStyle(
                fontSize: 38),
          )
        ],
      ),
    );
  }



  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: (){
          notificationServices.sendNotification(title: 'Theme changed',body:Get.isDarkMode?'Theme changed to light':'theme changed to dark', fln: flutterLocalNotificationsPlugin, );
          ThemeServices().switchTheme();
        print('Theme Button Tapped');
        },
        child: const Icon(Icons.nightlight_round, size: 20,),
      ),
      actions: const [
        Icon(Icons.person,size: 20,),
        SizedBox(width: 20,)
      ],
    );
  }
}
