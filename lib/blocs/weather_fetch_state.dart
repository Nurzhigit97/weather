import 'package:weather_api/data/models/weather_model.dart';

abstract class WeatherState {}

class InitWeatherState extends WeatherState {}

class LoadingWeatherState extends WeatherState {}

class ErrorWeatherState extends WeatherState {
  final String message;
  ErrorWeatherState(this.message);
}

class ResponseWeatherState extends WeatherState {
  final WeatherModel weather;
  ResponseWeatherState(this.weather);
}
