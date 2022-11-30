import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/cubits/setting_state.dart';
import 'package:weather_api/cubits/toggleThemeCubit/theme_cubit.dart';
import 'package:weather_api/screens/HomePage.dart';

import 'package:weather_api/widgets/toggle_dark_light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      //! значение bool получаем из SettingState class свойство isToggle
      child: BlocBuilder<ThemeCubit, SettingState>(builder: ((context, state) {
        return MaterialApp(
          //! easyLocalization
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          //! easyLocalization
          debugShowCheckedModeBanner: false,
          title: 'NurWeather',
          theme: state.isToggle ? darkTheme() : lightTheme(),
          home: HomePage(),
        );
      })),
    );
  }
}
