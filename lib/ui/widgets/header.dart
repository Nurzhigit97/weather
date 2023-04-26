import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_api/blocs/weather/weather_fetch_state.dart';

class Header extends StatelessWidget {
  final LoadedWeatherState fetchData;
  const Header({
    required this.fetchData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  fetchData.weather.city,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${fetchData.weather.current!['feelslike_c'].round()}°',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //!

                AutoSizeText(
                  fetchData.weather.text,
                  style: TextStyle(fontSize: 17),
                  minFontSize: 17,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: NetworkImage('https:${fetchData.weather.currentIcon}'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
