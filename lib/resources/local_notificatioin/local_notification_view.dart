// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_api/blocs/weather/weather_fetch_cubit.dart';
import 'package:weather_api/blocs/weather/weather_fetch_state.dart';
import 'package:weather_api/resources/local_notificatioin/local_notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;

class localNotificationView extends StatefulWidget {
  @override
  _localNotificationViewState createState() => _localNotificationViewState();
}

class _localNotificationViewState extends State<localNotificationView> {
  @override
  void initState() {
    super.initState();
    LocalNotificationService.init();
    tz.initializeTimeZones();
    LocalNotificationService.showScheduledWeek();
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
            child: Column(
              children: [
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await LocalNotificationService.showNotification(
                            id: 0,
                            title: 'WeatherNur',
                            body: 'Weather ${state.weather.temp}');
                      },
                      child: Text('localNotf'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        LocalNotificationService.showScheduleNotification(
                          id: 0,
                          title: 'WeatherNur',
                          body: 'Weather ${state.weather.temp}',
                          scheduleTime: DateTime.now().add(
                            Duration(seconds: 5),
                          ),
                        );
                        final snackBar = SnackBar(
                          content: Text(
                            'Sheduled every hour!',
                            style: TextStyle(fontSize: 24),
                          ),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      },
                      child: Text('SheduleNotf'),
                    ),
                  ],
                ), */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ElevatedButton(
                    //   onPressed: () async {
                    //     await LocalNotificationService
                    //         .showScheduleDailyNotification(
                    //       title: 'WeatherNur',
                    //       body: 'Weather ${state.weather.temp}',
                    //     );
                    //   },
                    //   child: Text('sheduleNotfDaily'),
                    // ),

                    /* ElevatedButton(
                      onPressed: () {
                        LocalNotificationService.showScheduleWeeklyNotification(
                          id: 0,
                          title: 'WeatherNur',
                          body: 'Weather ${state.weather.temp}',
                        );
                        final snackBar = SnackBar(
                          content: Text(
                            'Sheduledweekly  every day at 09:00!',
                            style: TextStyle(fontSize: 24),
                          ),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      },
                      child: Text('SheduleNotfWeek'),
                    ), */
                    /* ElevatedButton(
                      onPressed: () async {
                        await service.showScheuledNotificationWithPayload(
                            id: 0,
                            title: 'WeatherNur',
                            body: 'Weather ${state.weather.temp}',
                            payload: 'Payload Notification');
                      },
                      child: Text('payloadNotf'),
                    ), */

                    /* ElevatedButton.icon(
                    label: Text('StopNotf'),
                    onPressed: () => NotificationApi.stopNotifications(),
                    icon: Icon(Icons.stop_circle),
                  ), */
                  ],
                ),
              ],
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
