// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_api/blocs/weather_fetch_cubit.dart';
import 'package:weather_api/blocs/weather_fetch_state.dart';
import 'package:weather_api/resources/local_notificatioin/api/notification_api.dart';

class SheduledNotification extends StatefulWidget {
  num temp;
  String cityName;
  SheduledNotification({
    Key? key,
    required this.temp,
    required this.cityName,
  }) : super(key: key);

  @override
  _SheduledNotificationState createState() => _SheduledNotificationState();
}

class _SheduledNotificationState extends State<SheduledNotification> {
  NotificationApi notificationApi = NotificationApi();
  @override
  void initState() {
    notificationApi.initializeNotifications();
    NotificationApi.sheduleNotification(
      'WeatherNur',
      'Weather: ${widget.temp.floor()}}',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherFetchCubit, WeatherState>(
      builder: (context, state) {
        if (state is ErrorWeatherState) {
          return ListTile(
            leading: CircularProgressIndicator(),
            trailing: Text(state.errMsg),
          );
        }
        if (state is LoadedWeatherState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ElevatedButton.icon(
                //   onPressed: () => NotificationApi.sendNotification(
                //       'WeatherNur', 'Bishkek: ${widget.temp.floor()}'),
                //   label: Text('SimpleNotf'),
                //   icon: Icon(Icons.schedule),
                // ),
                // ElevatedButton.icon(
                //   onPressed: () => NotificationApi.sheduleNotification(
                //     'WeatherNur',
                //     'Bishkek: 18',
                //   ),
                //   icon: Icon(Icons.schedule),
                //   label: Text('SheduleNotf'),
                // ),

                /* ElevatedButton.icon(
                label: Text('StopNotf'),
                onPressed: () => NotificationApi.stopNotifications(),
                icon: Icon(Icons.stop_circle),
              ), */
              ],
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
