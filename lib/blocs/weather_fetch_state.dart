import 'package:weather_api/data/models/weather_model.dart';

abstract class WeatherState {}

class InitWeatherState extends WeatherState {}

class LoadingWeatherState extends WeatherState {}

class LoadedWeatherState extends WeatherState {
  final WeatherModel weather;
  LoadedWeatherState(this.weather);
}

class ErrorWeatherState extends WeatherState {
  final String message;
  ErrorWeatherState(this.message);
}
