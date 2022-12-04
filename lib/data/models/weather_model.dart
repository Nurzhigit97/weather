// WeatherModel weatherFromJson(String str) =>
//     WeatherModel.fromJson(json.decode(str));

class WeatherModel {
  final String city;
  final double temp;
  final String text;
  final String date;
  final String state;
  final int humidity;
  final double uvIndex;
  final String currentIcon;
  final double wind;
  final List forecast;
  final Map<String, dynamic>? forecastday;
  final List<dynamic>? forecastdata;

  WeatherModel(
      {this.city = '',
      this.date = '',
      this.forecast = const [],
      this.forecastday,
      this.forecastdata = const [],
      this.humidity = 0,
      this.state = '',
      this.temp = 0,
      this.text = '',
      this.uvIndex = 0,
      this.currentIcon = '',
      this.wind = 0});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        uvIndex: json['current']['uv'],
        currentIcon: json['current']['condition']['icon'],
        city: json['location']['name'],
        date: json['location']['localtime'],
        forecast: json['forecast']['forecastday'][0]['hour'],
        forecastday: json['forecast']['forecastday'][0]['day'],
        forecastdata: json['forecast']['forecastday'],
        humidity: json['current']['humidity'],
        state: json['location']['region'],
        temp: json['current']['temp_c'],
        text: json['current']['condition']['text'],
        wind: json['current']['wind_kph'],
      );
}
