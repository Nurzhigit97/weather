import 'package:dio/dio.dart';
import 'package:weather_api/models/weather_model.dart';
import 'package:weather_api/constants/api_constants.dart';

class WeatherRepository {
  Dio _dio = Dio();
  Future<WeatherModel> getAll() async {
    final response = await _dio.get(
        '${ApiConsts.baseUrl}/v1/forecast.json?key=${ApiConsts.weatherApi}&q=${city}&lang=${ApiConsts.lang}&days=${ApiConsts.days}&aqi=${ApiConsts.aqi}&alerts=${ApiConsts.alerts}');

    final dataWeather = await WeatherModel.fromJson(response.data);
    return dataWeather;
  }
}

String? city = ApiConsts.city;
