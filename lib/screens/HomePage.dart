import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/cubits/setting_state.dart';
import 'package:weather_api/cubits/toggleThemeCubit/theme_cubit.dart';
import 'package:weather_api/generated/locale_keys.g.dart';
import 'package:weather_api/models/weather_api.dart';
import 'package:weather_api/services/weather_service.dart';
import 'package:weather_api/widgets/choose_lang.dart';
import 'package:weather_api/widgets/forecast_card.dart';
import 'package:weather_api/widgets/get_by_location.dart';
import 'package:weather_api/widgets/header.dart';
import 'package:weather_api/widgets/search.dart';
import 'package:weather_api/widgets/select_city.dart';
import 'package:weather_api/widgets/week_weather.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherService weatherService = WeatherService();
  Weather? weather = Weather();
  bool _isLoadinf = true;

  Future getWeather() async {
    weather = await weatherService.getWeatherData();
    setState(() {
      getWeather();
      _isLoadinf = false;
    });
  }

  @override
  void initState() {
    getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.nameapp.tr()),
          elevation: 0,
          actions: [
            BlocBuilder<ThemeCubit, SettingState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    // BlocProvider.of<ThemeCubit>(context)
                    //     .toggleTheme(value: !state);
                    final cubit = context.read<ThemeCubit>();
                    cubit.toggleTheme(value: state.isToggle);
                  },
                  icon: state.isToggle
                      ? Icon(Icons.mode_night_rounded)
                      : Icon(Icons.light_mode),
                );
              },
            ),
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
        body: _isLoadinf
            ? const Center(
                child: SizedBox(
                    width: 30, height: 30, child: CircularProgressIndicator()),
              )
            : ListView(
                children: [
                  Search(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Header(
                            cityName: weather!.city,
                            description: weather!.text,
                            stateName: weather!.state,
                            forecastday: weather!.forecastday,
                            temp: weather!.temp),
                        ForecastCard(
                          forecast: weather!.forecast,
                        ),
                        WeekWeather(
                          forecastdata: weather!.forecastdata,
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
