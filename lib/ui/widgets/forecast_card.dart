import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_api/blocs/weather/weather_fetch_state.dart';

import '../../generated/locale_keys.g.dart';

class ForecastCard extends StatelessWidget {
  final LoadedWeatherState fetchData;
  const ForecastCard({
    required this.fetchData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(50, 0, 16, 38),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        AutoSizeText(
                            ' ${fetchData.weather.current!['wind_kph']}${LocaleKeys.wind_kph.tr()}'),
                      ],
                    ),
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        Icon(Icons.sunny),
                        SizedBox(
                          width: 5,
                        ),
                        AutoSizeText(
                          fetchData.weather.forecastdata![0]['astro']
                              ['sunrise'],
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        Icon(Icons.sunny_snowing),
                        SizedBox(
                          width: 5,
                        ),
                        AutoSizeText(
                          fetchData.weather.forecastdata![0]['astro']['sunset'],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(50, 0, 16, 38),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: fetchData.weather.forecast.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 100,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${fetchData.weather.forecast[index]['time'].split(' ').last}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Image.network(
                              'https:${fetchData.weather.forecast[index]['condition']['icon']}',
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${fetchData.weather.forecast[index]['temp_c'].toInt()}°',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
