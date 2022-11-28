import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_api/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ru'), Locale('ky')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}
