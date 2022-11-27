import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_api/models/weather_api.dart';
import 'package:weather_api/services/weather_service.dart';
import 'package:weather_api/widgets/forecast_card.dart';
import 'package:weather_api/widgets/search.dart';
import 'package:weather_api/widgets/header.dart';
import 'package:weather_api/widgets/toggle_dark_light_theme.dart';
import 'package:weather_api/widgets/week_weather.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WeatherService weatherService = WeatherService();
  Weather weather = Weather();

  String image = '';
  Color defaultColor = Colors.black;
  int hour = 0;
  bool isday = false;
  bool isNight = false;
  String icon = '';

  Future getWeather() async {
    weather = await weatherService.getWeatherData();
    setState(() {
      getWeather();
    });
  }

  @override
  void initState() {
    getWeather();
    super.initState();
  }

  bool _isToggleTheme = false;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    final hourDay = date.hour;
    if (hourDay >= 7 && hour < 16) {
      _isToggleTheme = true;
    } else {
      _isToggleTheme = false;
    }
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NurWeather',
      theme: _isToggleTheme ? lightTheme() : darkTheme(),
      home: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Search(),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Header(
                        cityName: weather.city,
                        description: weather.text,
                        stateName: weather.state,
                        forecastday: weather.forecastday,
                        temp: weather.temp),
                    ForecastCard(
                      forecast: weather.forecast,
                    ),
                    WeekWeather(
                      forecastdata: weather.forecastdata,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
