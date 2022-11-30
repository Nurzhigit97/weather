import 'package:dio/dio.dart';
import 'package:weather_api/models/weather_api.dart';
import 'package:weather_api/constants/api_constants.dart';

class WeatherService {
  Future<Weather?> getWeatherData() async {
    Dio dio = Dio();
    try {
      final response = dio.get(
          '${ApiConsts.baseUrl}/v1/forecast.json?key=${ApiConsts.weatherApi}&q=${city}&lang=${ApiConsts.lang}&days=${ApiConsts.days}&aqi=${ApiConsts.aqi}&alerts=${ApiConsts.alerts}');
      final json = await response;
      return Weather.fromJson(json.data);
    } on DioError catch (e) {
      print("Ошибка: $e");
    }
    return null;
  }
}

//! Получает наз. города из класса ApiConsts
String? city = ApiConsts.city;
