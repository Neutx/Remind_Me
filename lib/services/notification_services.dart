// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotifyHelper {
  final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings
  _androidInitializationSettings = AndroidInitializationSettings('icon');

  void initialiseNotification() async{
    InitializationSettings initializationSettings = InitializationSettings(
      android: _androidInitializationSettings
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification(String title, String body) {

    AndroidNotificationDetails("channelID", "channelName",
        importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails = NotificationDetails();

    _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
//hey
  }


}






// class NotifyHelper {
//   FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin(); //
//
//   void initializeNotification() async {
//     final AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('icon');
//
//     {
//       InitializationSettings initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid,
//       );
//       await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
//     }

    // void sendNotification(String title, String body) async {
    //   AndroidNotificationDetails("channelID", "channelName",
    //       importance: Importance.max, priority: Priority.high);
    //   NotificationDetails notificationDetails = NotificationDetails();
    //
    //   _flutterLocalNotificationsPlugin.show(
    //     0,
    //     title,
    //     body,
    //     notificationDetails,
    //   );
    // }
//   }
// }

//   Future selectNotification(String payload) async {
//     // ignore: unnecessary_null_comparison
//     if (payload != null) {
//       //selectedNotificationPayload = "The best";
//       //selectNotificationSubject.add(payload);
//       print('notification payload: $payload');
//     } else {
//       print("Notification Done");
//     }
//
//     if(payload=="Theme Changed"){
//       //going nowhere
//     }else{
//       Get.to(()=>Container(color: Colors.white,));
//     }
//   }
// }
//
// displayNotification({required String title, required String body}) async {
//   print("doing test");
//   var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//       'your channel id', 'your channel name', 'your channel description',
//       importance: Importance.max, priority: Priority.high);
//   var platformChannelSpecifics = new NotificationDetails(
//       android: androidPlatformChannelSpecifics);
//   await  FlutterLocalNotificationsPlugin.show(
//     0,
//     'You change your theme',
//     'You changed your theme back !',
//     platformChannelSpecifics,
//     payload: 'It could be anything you pass',
//   );
