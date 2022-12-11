import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/blocs/weather_fetch_cubit.dart';
import 'package:weather_api/blocs/weather_fetch_state.dart';

import '../../generated/locale_keys.g.dart';

class ForecastCard extends StatelessWidget {
  ForecastCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherFetchCubit, WeatherState>(
      builder: (context, state) {
        if (state is InitWeatherState || state is LoadingWeatherState) {
          return CircularProgressIndicator();
        }
        if (state is ErrorWeatherState) {
          return ListTile(
            leading: CircularProgressIndicator(),
            trailing: Text(state.errMsg.substring(0, 8)),
          );
        }
        if (state is LoadedWeatherState) {
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
                                  '${state.weather.current!['wind_dir']} ${state.weather.current!['wind_kph']}${LocaleKeys.wind_kph.tr()}'),
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
                                state.weather.forecastdata![0]['astro']
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
                                state.weather.forecastdata![0]['astro']
                                    ['sunset'],
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
                        itemCount: state.weather.forecast.length,
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
                                    '${state.weather.forecast[index]['time'].split(' ').last}',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Image.network(
                                    'https:${state.weather.forecast[index]['condition']['icon']}',
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '${state.weather.forecast[index]['temp_c'].toInt()}°',
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
        return SizedBox.shrink();
      },
    );
  }
}
