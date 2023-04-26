import 'package:flutter/material.dart';

class ThemeDarkLight {
  static ThemeData lightTheme() => ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue[300]),
        scaffoldBackgroundColor: Colors.blue[300],
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Colors.white,
              fontFamily: 'Georgia',
            ),
            bodySmall: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white)),
      );

  static ThemeData darkTheme() => ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 10, 67, 153)),
        scaffoldBackgroundColor: const Color.fromARGB(255, 10, 67, 153),
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Colors.white,
            ),
            titleMedium: TextStyle(
              color: Colors.white,
            )),
      );
}
