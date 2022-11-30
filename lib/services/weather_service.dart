/* // import 'package:weather_api/constants/api_constants.dart';

// class WeatherService {
//  final Dio _dio = Dio();

  // Future<Weather?> getWeatherData() async {
  //   try {
  //     final response = _dio.get(
  //         '${ApiConsts.baseUrl}/v1/forecast.json?key=${ApiConsts.weatherApi}&q=${city}&lang=${ApiConsts.lang}&days=${ApiConsts.days}&aqi=${ApiConsts.aqi}&alerts=${ApiConsts.alerts}');
  //     final json = weatherFromJson(response);
  //     return json;
  //   } on DioError catch (e) {
  //     print("Ошибка: $e");
  //   }
  //   return null;
  // }

  // Future<Weather> getWeatherData() async {
  //   final response = await http.get(Uri.parse(
  //       '${ApiConsts.baseUrl}/v1/forecast.json?key=${ApiConsts.weatherApi}&q=${city}&lang=${ApiConsts.lang}&days=${ApiConsts.days}&aqi=${ApiConsts.aqi}&alerts=${ApiConsts.alerts}'));

  //   final dataWeather = weatherFromJson(utf8.decode(response.bodyBytes));
  //   print(dataWeather);
  //   return dataWeather;
  // } 
 }

//! Получает наз. города из класса ApiConsts
 String? city = ApiConsts.city;
 */