import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather_api/blocs/selected_city_cubit.dart';
import 'package:weather_api/resources/generated/locale_keys.g.dart';
import 'package:weather_api/data/models/weather_model.dart';

class WeatherRepository {
  Dio _dio;
  WeatherRepository(this._dio);
/* Future<Weather> getWeatherData() async {
    final response = await http.get(Uri.parse(
        '${ApiConsts.baseUrl}/v1/forecast.json?key=c8a70185a0c34463b4f171826222311&q=Bishkek&lang=ru&days=7&aqi=no&alerts=no'));

    final dataWeather = weatherFromJson(utf8.decode(response.bodyBytes));
    print(dataWeather);
    return dataWeather;
  }  */

  Future<WeatherModel> fetchWeather() async {
    try {
      Map<String, dynamic> params = {
        'key': "c8a70185a0c34463b4f171826222311",
        'q': 'Bishkek',
        "lang": LocaleKeys.lang.tr(),
        "days": 7,
      };
      final response = await _dio.get(
          'http://api.weatherapi.com/v1/forecast.json',
          queryParameters: params);
      final json = response.data;
      return WeatherModel.fromJson(json);
    } catch (err) {
      return Future.error('Get Weather Error: $err');
    }
  }

  Future<WeatherModel> selectWeatherByCity(City city) async {
    try {
      Map<String, dynamic> params = {
        'key': "c8a70185a0c34463b4f171826222311",
        'q': city.name(),
        "lang": LocaleKeys.lang.tr(), //!do fix: dont changing lang
        "days": 7,
      };
      final response = await _dio.get(
          'http://api.weatherapi.com/v1/forecast.json',
          queryParameters: params);
      final json = response.data;
      return WeatherModel.fromJson(json);
    } catch (err) {
      return Future.error('Get Weather Error: $err');
    }
  }

  Future<WeatherModel> searchWeatherByCity(String city) async {
    try {
      Map<String, dynamic> params = {
        'key': "c8a70185a0c34463b4f171826222311",
        'q': city,
        "lang": LocaleKeys.lang.tr(), //!do fix: dont changing lang
        "days": 7,
      };
      final response = await _dio.get(
          'http://api.weatherapi.com/v1/forecast.json',
          queryParameters: params);
      final json = response.data;
      return WeatherModel.fromJson(json);
    } catch (e) {
      return Future.error('get_weather_error');
    }
  }
}
