import 'dart:convert';
import 'package:weather_api/models/weather_api.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<Weather> getWeatherData() async {
    final uri = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=c8a70185a0c34463b4f171826222311&q=${city}&days=7&aqi=no&alerts=no');
    final response = await http.get(uri);
    try {
      return Weather.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception("Can't find City");
    }
  }
}

String? city = 'Dubai';
