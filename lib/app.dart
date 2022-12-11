import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/blocs/weather/weather_fetch_cubit.dart';

import 'package:weather_api/ui/pages/home_page/home_page.dart';
import 'package:weather_api/blocs/theme_cubit.dart';
import 'package:weather_api/ui/widgets/toggle_dark_light_theme.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    // Future refresh() async {
    //   await context.read<WeatherFetchCubit>().fetchWeather();
    // }

    final themeCubit = context.watch<ThemeCubit>();
    return MaterialApp(
      //! easyLocalization
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      //! easyLocalization
      debugShowCheckedModeBanner: false,
      title: 'NurWeather',
      theme: themeCubit.state.isToggle! ? darkTheme() : lightTheme(),
      home: HomePage(),
    );
  }
}
