import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:weather_api/models/weather_api.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  // Future<Weather> getWeatherData() async {
  //   final uri = Uri.parse(
  //       'http://api.weatherapi.com/v1/forecast.json?key=c8a70185a0c34463b4f171826222311&q=${city}&days=7&aqi=no&alerts=no');
  //   final response = await http.get(uri);
  //   try {
  //     return Weather.fromJson(jsonDecode(response.body));
  //   } catch (e) {
  //     throw Exception("Can't find City");
  //   }
  // }
  Future<Weather?> getWeatherData() async {
    Dio dio = Dio();
    try {
      final response = dio.get(
          'http://api.weatherapi.com/v1/forecast.json?key=c8a70185a0c34463b4f171826222311&q=${city}&lang=ru&days=7&aqi=no&alerts=no');
      final json = await response.then((value) => value);
      return Weather.fromJson(json.data);
    } on DioError catch (e) {
      print(e.response!.data);
    }
  }
}

String? city = 'Jalal-abad';
