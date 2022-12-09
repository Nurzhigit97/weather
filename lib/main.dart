import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/app.dart';
import 'package:weather_api/blocs/selected_city_cubit.dart';
import 'package:weather_api/blocs/theme_cubit.dart';
import 'package:weather_api/blocs/weather_fetch_cubit.dart';
import 'package:weather_api/data/repository/weather_repository.dart';

Future<void> main() async {
  //! easy localization
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final _dio = Dio();
  final repository = WeatherRepository(_dio);

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ru'), Locale('ky')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MultiBlocProvider(providers: [
        BlocProvider(create: ((_) => ThemeCubit())),
        BlocProvider(create: ((_) => WeatherFetchCubit(repository))),
        BlocProvider(create: ((_) => SelectCityCubit())),
      ], child: App()),
    ),
  );
}
