import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future init({bool scheduled = false}) async {
    var initAndroidSettings =
        await AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = await DarwinInitializationSettings();
    final settings =
        InitializationSettings(android: initAndroidSettings, iOS: ios);
    await _notifications.initialize(settings);
  }

/* //! simple notification
  static Future showNotification({
    var id = 0,
    var title,
    var body,
    var payload,
  }) async =>
     await _notifications.show(id, title, body, await notificationDetails());
//! notification after 4 seconds
  static Future showScheduleNotification({
    var id = 0,
    var title,
    var body,
    var payload,
    required DateTime scheduleTime,
  }) async =>
      _notifications.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduleTime, tz.local),
        await notificationDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
      );
*/

  static Future showScheduledWeek() async => _notifications.periodicallyShow(
      2,
      'WeatherNur',
      'Weather 12',
      RepeatInterval.daily,
      await notificationDetails());

//! notification every day at 09:36 hour
  static Future showScheduleDailyNotification({
    var id = 2,
    var title,
    var body,
    var payload,
  }) async =>
      _notifications.zonedSchedule(
        id,
        title,
        body,
        _scheduledDaily(
          Time(12, 38),
        ),
        await notificationDetails(),
        payload: payload,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time,
      );

//! for get day
  static tz.TZDateTime _scheduledDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local); // fix: dont get current hour
    final scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour - 6, //work only for Bishkek
      time.minute,
      time.second,
    );
    print('test now time $now');
    print('test schedule time $scheduledTime');

    return scheduledTime.isBefore(now)
        ? scheduledTime.add(
            Duration(days: 7),
          )
        : scheduledTime;
  }

/* //! notification если хотим выбрать по каким дням должен работат уведомление
  static Future showScheduleWeeklyNotification({
    var id = 0,
    var title,
    var body,
    var payload,
  }) async =>
      _notifications.zonedSchedule(
        id,
        title,
        body,
        //! in this days of week will call
        _scheduledWeekly(Time(11, 11), days: [
          DateTime.monday,
          DateTime.tuesday,
          DateTime.wednesday,
          DateTime.thursday,
          DateTime.friday,
          DateTime.saturday,
          DateTime.sunday,
        ]),
        await notificationDetails(),
        payload: payload,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );
//! for get week
  static tz.TZDateTime _scheduledWeekly(Time time, {required List<int> days}) {
    tz.TZDateTime scheduleDate = _scheduledDaily(time);

    while (!days.contains(scheduleDate.weekday)) {
      scheduleDate = scheduleDate.add(Duration(days: 7));
    }
    print('test schedule date $scheduleDate');
    return scheduleDate;
  } */

//! settings for sound etc
  static notificationDetails() async {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          '2',
          'flutterEmbedding',
          // sound: RawResourceAndroidNotificationSound('notification'),
          importance: Importance.max,
          playSound: true,
        ),
        iOS: DarwinNotificationDetails(sound: 'notification.mp3'));
  }
}
