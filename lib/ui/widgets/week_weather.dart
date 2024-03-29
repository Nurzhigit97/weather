import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/blocs/weather/weather_fetch_cubit.dart';
import 'package:weather_api/blocs/weather/weather_fetch_state.dart';
import 'package:weather_api/resources/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class WeekWeather extends StatelessWidget {
  final LoadedWeatherState fetchData;
  const WeekWeather({
    required this.fetchData,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final weekList = <String>[
      LocaleKeys.weekMap_monday.tr(),
      LocaleKeys.weekMap_tuesday.tr(),
      LocaleKeys.weekMap_wednesday.tr(),
    ];

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(50, 0, 16, 38),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.week.tr(),
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: const [
                  Text(
                    'Max',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Min',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              //! for week
              /* SizedBox(
                      width: 110,
                      height: 200,
                      child: ListView.builder(
                        itemCount: weekList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 24, bottom: 22),
                                child: Text(
                                  weekList[index],
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ), */
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: ListView.builder(
                    itemCount: fetchData.weather.forecastdata!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      final weatherData =
                          fetchData.weather.forecastdata![index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${weatherData['date']}',
                            style: const TextStyle(fontSize: 15),
                          ),
                          Image.network(
                            'https:${weatherData['day']['condition']['icon']}',
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: 70,
                            child: Row(
                              children: [
                                Text(
                                  '${weatherData['day']['maxtemp_c'].round()}°',
                                  style: const TextStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  ' ${weatherData['day']['mintemp_c'].round()}°',
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
