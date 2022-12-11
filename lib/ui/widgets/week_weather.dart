import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/blocs/weather_fetch_cubit.dart';
import 'package:weather_api/blocs/weather_fetch_state.dart';
import 'package:weather_api/resources/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class WeekWeather extends StatelessWidget {
  const WeekWeather({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weekList = <String>[
      LocaleKeys.weekMap_monday.tr(),
      LocaleKeys.weekMap_tuesday.tr(),
      LocaleKeys.weekMap_wednesday.tr(),
    ];

    return BlocBuilder<WeatherFetchCubit, WeatherState>(
      builder: (context, state) {
        if (state is ErrorWeatherState) {
          return Center(
            child: Text(state.errMsg),
          );
        }
        if (state is LoadedWeatherState) {
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
                          itemCount: state.weather.forecastdata!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            final weatherData =
                                state.weather.forecastdata![index];
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
                                Row(
                                  children: [
                                    Text(
                                      '${weatherData['day']['maxtemp_c']}°',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      width: 11,
                                    ),
                                    Text(
                                      ' ${weatherData['day']['mintemp_c']}°',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
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
        return SizedBox.shrink();
      },
    );
  }
}
