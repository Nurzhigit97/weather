import 'package:weather_api/models/weather_model.dart';
import 'package:dio/dio.dart';

final Dio _dio = Dio();
Future<WeatherModel> getAll(String city, [lang]) async {
  try {
    Map<String, dynamic> params = {
      'key': "c8a70185a0c34463b4f171826222311",
      'q': city,
      "lang": lang,
      "days": 5,
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
