import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices{
final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin=
     FlutterLocalNotificationsPlugin();
final AndroidInitializationSettings _androidInitializationSettings=
AndroidInitializationSettings('app_icon');

void intialiseNotifications() async{
  InitializationSettings initializationSettings=InitializationSettings(
    android: _androidInitializationSettings,
  );
  await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
}
void sendNotification(String title ,String body) async{
 AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails
   ('channelId', 'channelName',
 importance: Importance.max ,
   priority: Priority.high,
 );

  NotificationDetails notificationDetails=NotificationDetails();
await _flutterLocalNotificationsPlugin.show(01, title, body, notificationDetails);
}
}