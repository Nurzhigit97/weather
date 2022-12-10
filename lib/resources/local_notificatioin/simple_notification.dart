// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_api/blocs/weather_fetch_cubit.dart';
import 'package:weather_api/blocs/weather_fetch_state.dart';
import 'package:weather_api/resources/local_notificatioin/api/local_notification_service.dart';
import 'package:weather_api/ui/pages/home_page/home.dart';

class SheduledNotification extends StatefulWidget {
  late String payload;
  SheduledNotification({
    super.key,
    required this.payload,
  });
  @override
  _SheduledNotificationState createState() => _SheduledNotificationState();
}

class _SheduledNotificationState extends State<SheduledNotification> {
  late final LocalNotificationService service;
  @override
  void initState() {
    super.initState();
    service = LocalNotificationService();
    service.initialize();
    listenNotification();
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
                ElevatedButton(
                  onPressed: () async {
                    await service.showNotification(
                        id: 0,
                        title: 'WeatherNur',
                        body: 'Weather ${state.weather.temp}');
                  },
                  child: Text('localNotf'),
                ),
                ElevatedButton(
                  onPressed: () {
                    service.showScheuledNotification(
                      id: 0,
                      title: 'WeatherNur',
                      body: 'Weather ${state.weather.temp}',
                      seconds: 5,
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
                ElevatedButton(
                  onPressed: () async {
                    await service.showScheuledNotificationWithPayload(
                        id: 0,
                        title: 'WeatherNur',
                        body: 'Weather ${state.weather.temp}',
                        payload: 'Payload Notification');
                  },
                  child: Text('payloadNotf'),
                ),

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

  void listenNotification() =>
      service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => Home()),
        ),
      );
    }
  }
}
