import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header({
    super.key,
    required this.cityName,
    required this.description,
    required this.stateName,
    required this.temp,
    required this.forecastday,
  });

  String cityName;
  String stateName;
  double temp;
  String description;
  Map<String, dynamic>? forecastday;

  @override
  Widget build(BuildContext context) {
    switch (description.toLowerCase()) {
      case 'rainy':
        iconWeather = "assets/rainy.png";
        break;
      case 'snow':
        iconWeather = "assets/snow.png";
        break;
      default:
        iconWeather = "assets/sun.png";
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  cityName,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${temp.toInt()}°',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //!

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Max.: ${forecastday?['maxtemp_c']}° Min.: ${forecastday?['mintemp_c']}°',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Image(
              image: AssetImage('$iconWeather'),
            ),
          ),
        ],
      ),
    );
  }
}

String? iconWeather;
