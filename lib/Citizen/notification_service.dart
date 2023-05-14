import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    // Android initialization
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    // iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(
      String userName, String body, int yyyy, int mm, int dd) async {
    // ignore: unused_local_variable
    int year = 0;

    DateTime currentTime = DateTime.now();
    DateTime dt =
        DateTime(yyyy, mm, dd, 7, 00, 00); //Or whatever DateTime you want
    if (currentTime.compareTo(dt) > 0) {
      year = currentTime.year + 1;
    } else {
      year = currentTime.year;
    }
    // print('year       =         $year');
    var tzdatetime =
        tz.TZDateTime.from(dt, tz.local); //could be var instead of final

    Duration difference = currentTime.difference(
        dt); //difference between birth date of user and current date;
    int differenceInYears = (difference.inDays / 365).floor();

    int id = 0;
    String title = "$userName, Happy Birth Day!! ";

    for (int i = 0; i < 50; i++) {
      //Schedule birthday notifications for 50 years

      dt = DateTime(year + i, mm, dd, 7, 00, 00); //Shows birthday notification at 7 AM.
      // dt = currentTime.add(Duration(seconds: 10 + (i * 10))); //(Testing Code) scheduled birthday notification (change number of iterations of loop before testing(i.e. i<5) for 5 notifications)
      tzdatetime =
          tz.TZDateTime.from(dt, tz.local); //could be var instead of final
      body =
          "You turned $differenceInYears. Let us help you plant a tree to make this occasion memorable.";

      differenceInYears += 1;
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tzdatetime,

        const NotificationDetails(
          // Android details
          android: AndroidNotificationDetails('main_channel', 'Main Channel',
              channelDescription: "main",
              importance: Importance.max,
              priority: Priority.max),

          // iOS details
          // iOS: IOSNotificationDetails(
          //   sound: 'default.wav',
          //   presentAlert: true,
          //   presentBadge: true,
          //   presentSound: true,
          // ),
        ),

        // Type of time interpretation
        androidAllowWhileIdle:
            true, // To show notification even when the app is closed
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
      id += 1;
    }
  }
}
