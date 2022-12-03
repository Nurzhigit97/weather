// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "nameapp": "Weather",
  "hourToday": "Today",
  "week": "Week",
  "lang": "en",
  "weekMap": {
    "monday": "Monday",
    "tuesday": "Tuesday",
    "wednesday": "Wednesday",
    "thursday": "Thursday",
    "friday": "Friday",
    "saturday": "Saturday",
    "sunday": "Sunday"
  }
};
static const Map<String,dynamic> ky = {
  "nameapp": "Аба ырайы",
  "hourToday": "Бугун",
  "week": "Аптанын күндөрү",
  "lang": "ky",
  "weekMap": {
    "monday": "Дүйшөмбү",
    "tuesday": "Шейшемби",
    "wednesday": "Шаршемби",
    "thursday": "Бейшемби",
    "friday": "Жума",
    "saturday": "Ишемби",
    "sunday": "Жекшемби"
  }
};
static const Map<String,dynamic> ru = {
  "nameapp": "Погода",
  "hourToday": "Сегодня",
  "week": "Неделя",
  "lang": "ru",
  "weekMap": {
    "monday": "Понедельник",
    "tuesday": "Вторник",
    "wednesday": "Среда",
    "thursday": "Четверг",
    "friday": "Пятница",
    "saturday": "Суббота",
    "sunday": "Воскресенье"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ky": ky, "ru": ru};
}
