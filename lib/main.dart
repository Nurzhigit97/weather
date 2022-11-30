import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/cubits/weatherFetchCubit/weather_fetch_cubit.dart';
import 'package:weather_api/my_app.dart';
import 'package:weather_api/cubits/toggleThemeCubit/theme_cubit.dart';
import 'package:weather_api/repository/api_repository.dart';

Future<void> main() async {
  //! easy localization
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ru'), Locale('ky')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: ((context) => ThemeCubit()),
          ),
          BlocProvider(
            create: ((context) => WeatherCubit(WeatherRepository())),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}
