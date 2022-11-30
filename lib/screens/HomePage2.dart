import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/cubits/toggleThemeCubit/theme_toggle_view.dart';
import 'package:weather_api/cubits/weatherFetchCubit/weather_fetch_cubit.dart';
import 'package:weather_api/cubits/weatherFetchCubit/weather_fetch_state.dart';
import 'package:weather_api/generated/locale_keys.g.dart';
import 'package:weather_api/widgets/choose_lang.dart';
import 'package:weather_api/widgets/forecast_card.dart';
import 'package:weather_api/widgets/get_by_location.dart';
import 'package:weather_api/widgets/header.dart';
import 'package:weather_api/widgets/search.dart';
import 'package:weather_api/widgets/select_city.dart';
import 'package:weather_api/widgets/week_weather.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<WeatherCubit>();
      cubit.fetchWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is InitWeatherState || state is LoadingWeatherState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ResponseWeatherState) {
          final weather = state.weather;
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(LocaleKeys.nameapp.tr()),
                elevation: 0,
                actions: [
                  ThemeToggleView(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                    ),
                    child: chooseLang(context),
                  ),
                  SelectCity(),
                  GetByLocation(),
                ],
              ),
              body: ListView(
                children: [
                  Search(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Header(
                            cityName: weather.city,
                            description: weather.text,
                            stateName: weather.state,
                            forecastday: weather.forecastday,
                            temp: weather.temp),
                        ForecastCard(
                          forecast: weather.forecast,
                        ),
                        WeekWeather(
                          forecastdata: weather.forecastdata,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is ErrorWeatherState) {
          return Center(
            child: Text(state.message),
          );
        }
        return Center(
          child: Text(state.toString()),
        );
      },
    );
  }
}
