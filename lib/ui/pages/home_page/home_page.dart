import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/resources/local_notificatioin/api/notification_api.dart';
import 'package:weather_api/resources/local_notificatioin/simple_notification.dart';
import 'package:weather_api/ui/widgets/choose_lang.dart';
import 'package:weather_api/ui/widgets/forecast_card.dart';
import 'package:weather_api/ui/widgets/header.dart';
import 'package:weather_api/ui/widgets/select_city_view.dart';
import 'package:weather_api/ui/widgets/week_weather.dart';
import 'package:weather_api/ui/widgets/theme_toggle_view.dart';
import 'package:weather_api/ui/widgets/getbyloc_view.dart';
import 'package:weather_api/ui/widgets/search_view.dart';
import 'package:weather_api/blocs/weather_fetch_cubit.dart';
import 'package:weather_api/blocs/weather_fetch_state.dart';
import 'package:weather_api/resources/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherCubit = context.read<WeatherFetchCubit>();
    weatherCubit.fetchWeather();
    Future refresh() async {
      await context.read<WeatherFetchCubit>().fetchWeather();
    }

    return BlocBuilder<WeatherFetchCubit, WeatherState>(
      builder: (context, state) {
        if (state is LoadingWeatherState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ErrorWeatherState) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is LoadedWeatherState) {
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
                  SelectCityView(),
                  GetByLocationView(),
                ],
              ),
              body: RefreshIndicator(
                onRefresh: refresh,
                child: ListView(
                  children: [
                    SearchView(),
                    SheduledNotification(temp: weather.temp),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Header(
                              cityName: weather.city,
                              description: weather.text,
                              stateName: weather.state,
                              forecastday: weather.forecastday,
                              temp: weather.temp,
                              currentIcon: weather.currentIcon),
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
            ),
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
