import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/blocs/weather/weather_fetch_cubit.dart';
import 'package:weather_api/blocs/weather/weather_fetch_state.dart';

class Header extends StatelessWidget {
  Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherFetchCubit, WeatherState>(
      builder: (context, state) {
        if (state is ErrorWeatherState) {
          return Text(state.errMsg);
        }
        if (state is LoadedWeatherState) {
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
                        state.weather.city,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${state.weather.current!['feelslike_c'].round()}°',
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //!

                      AutoSizeText(
                        state.weather.text,
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
                        image:
                            NetworkImage('https:${state.weather.currentIcon}'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

String? iconWeather;
