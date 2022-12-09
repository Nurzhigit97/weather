import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/blocs/weather_fetch_cubit.dart';
import 'package:weather_api/blocs/weather_fetch_state.dart';
import 'package:weather_api/resources/generated/locale_keys.g.dart';

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
          return Container(
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
                      LocaleKeys.hourToday.tr(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
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
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
