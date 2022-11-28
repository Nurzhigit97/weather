import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:weather_api/generated/locale_keys.g.dart';
import 'package:weather_api/models/weather_api.dart';
import 'package:weather_api/services/weather_service.dart';
import 'package:weather_api/widgets/choose_lang.dart';
import 'package:weather_api/widgets/forecast_card.dart';
import 'package:weather_api/widgets/header.dart';
import 'package:weather_api/widgets/search.dart';
import 'package:weather_api/widgets/select_city.dart';
import 'package:weather_api/widgets/toggle_dark_light_theme.dart';
import 'package:weather_api/widgets/week_weather.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WeatherService weatherService = WeatherService();
  Weather weather = Weather();

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

  toggleTheme() {
    setState(() {
      _isToggleTheme = !_isToggleTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'NurWeather',
      theme: _isToggleTheme ? darkTheme() : lightTheme(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.nameapp.tr()),
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: toggleTheme,
                  icon: _isToggleTheme
                      ? Icon(Icons.mode_night_rounded)
                      : Icon(Icons.light_mode)),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                ),
                child: chooseLang(context),
              ),
              SelectCity(),
            ],
          ),
          body: ListView(
            children: [
              Search(),
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
    );
  }
}
