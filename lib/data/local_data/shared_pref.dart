import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../blocs/weather/weather_fetch_cubit.dart';

class SharedPref {
  static Future<void> getCityNameFromSharedPrefAndFetchWeather(
      BuildContext context) async {
    final String _cityName;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    _cityName = prefs.getString("cityName")!;

    final fetchWeather = context.read<WeatherFetchCubit>();
    fetchWeather.fetchWeather(_cityName);
  }
}
