import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/mya_app.dart';
import 'package:weather_api/cubits/setting_state.dart';
import 'package:weather_api/cubits/toggleThemeCubit/theme_cubit.dart';

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
        ],
        child: BlocBuilder<ThemeCubit, SettingState>(
          builder: (context, state) {
            return MyApp();
          },
        ),
      ),
    ),
  );
}
