// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:weather_api/resources/local_notificatioin/api/notification_api.dart';

class SheduledNotification extends StatefulWidget {
  double temp;
  SheduledNotification({
    Key? key,
    required this.temp,
  }) : super(key: key);

  @override
  _SheduledNotificationState createState() => _SheduledNotificationState();
}

class _SheduledNotificationState extends State<SheduledNotification> {
  NotificationApi notificationApi = NotificationApi();
  @override
  void initState() {
    super.initState();
    notificationApi.initializeNotifications();
    NotificationApi.sheduleNotification(
      'WeatherNur',
      'Bishkek: ${widget.temp}}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () => NotificationApi.sendNotification(
                'WeatherNur', 'Bishkek: ${widget.temp}'),
            label: Text('SimpleNotf'),
            icon: Icon(Icons.schedule),
          ),
          // ElevatedButton.icon(
          //   onPressed: () => NotificationApi.sheduleNotification(
          //     'WeatherNur',
          //     'Bishkek: 18',
          //   ),
          //   icon: Icon(Icons.schedule),
          //   label: Text('SheduleNotf'),
          // ),
          ElevatedButton.icon(
            label: Text('StopNotf'),
            onPressed: () => NotificationApi.stopNotifications(),
            icon: Icon(Icons.stop_circle),
          ),
        ],
      ),
    );
  }
}
