import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        body: ListView(
          children: [
            RefreshIndicator(
              onRefresh: refresh,
              child: Column(
                children: [
                  SearchView(),
                  BlocBuilder<WeatherFetchCubit, WeatherState>(
                    builder: (context, state) {
                      if (state is ErrorWeatherState) {
                        return Center(
                          child: Text(
                            '${state.errMsg}',
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                        );
                      }
                      if (state is LoadedWeatherState) {
                        return Container(
                          width: double.infinity,
                          height: 500,
                          child: ListView(
                            children: [
                              SheduledNotification(
                                temp: state.weather.temp,
                                cityName: state.weather.city,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  children: [
                                    Header(),
                                    ForecastCard(),
                                    WeekWeather(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
