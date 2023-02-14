import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../service/notification_service.dart';
import '../../../service/theme_services.dart';
import '../../settings/settings_screen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key});
  NotifyHelper notificationServices = NotifyHelper();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: context.theme.appBarTheme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          notificationServices.sendNotification(
              title: 'Theme changed',
              body: Get.isDarkMode
                  ? 'Theme changed to light'
                  : 'theme changed to dark',
              fln: flutterLocalNotificationsPlugin);
          ThemeServices().switchTheme();
          print('Theme Button Tapped');
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      title: Text(
        "Reminder Me",
        style: TextStyle(
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      actions: [
        GestureDetector(
          onTap: () { Get.to (() => SettingsScreen()); },
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/SplashScreen.jpg"),
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
