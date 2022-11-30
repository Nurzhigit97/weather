import 'package:dio/dio.dart';
import 'package:weather_api/models/weather_api.dart';

class WeatherService {
  Future<Weather?> getWeatherData() async {
    Dio dio = Dio();
    try {
      final response = dio.get(
          'http://api.weatherapi.com/v1/forecast.json?key=c8a70185a0c34463b4f171826222311&q=${city}&lang=ru&days=7&aqi=no&alerts=no');
      final json = await response;
      return Weather.fromJson(json.data);
    } on DioError catch (e) {
      print("Ошибка: $e");
    }
    return null;
  }
}

String? city = 'Jalal-abad';
