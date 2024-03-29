import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather_api/blocs/selected_city_cubit.dart';
import 'package:weather_api/data/models/weather_model.dart';

class WeatherRepository {
  Dio _dio;
  final String url = 'http://api.weatherapi.com/v1/forecast.json';
  final String key = "f413fe52174c434294f134955220812";

  WeatherRepository(this._dio);

  Future<WeatherModel> fetchWeather(String? _cityName) async {
    try {
      Map<String, dynamic> params = {
        'key': key,
        'q': _cityName,
        "lang": tr('lang'),
        "days": 7,
      };
      final response = await _dio.get(url, queryParameters: params);
      final json = response.data;
      return WeatherModel.fromJson(json);
    } catch (_) {
      return Future.error(tr('errorFetch'));
    }
  }

  Future<WeatherModel> selectWeatherByCity(City city) async {
    try {
      Map<String, dynamic> params = {
        'key': key,
        'q': city.name(),
        "lang": tr('lang'), //!do fix: dont changing lang
        "days": 7,
      };
      final response = await _dio.get(url, queryParameters: params);
      final json = response.data;
      return WeatherModel.fromJson(json);
    } catch (_) {
      return Future.error(tr('errorFetch'));
    }
  }

  Future<WeatherModel> searchWeatherByCity(String city) async {
    try {
      Map<String, dynamic> params = {
        'key': key,
        'q': city,
        "lang": tr('lang'), //!do fix: dont changing lang
        "days": 7,
      };
      final response = await _dio.get(url, queryParameters: params);
      return WeatherModel.fromJson(response.data);
    } catch (_) {
      return Future.error(tr('errorFetch'));
    }
  }
}
