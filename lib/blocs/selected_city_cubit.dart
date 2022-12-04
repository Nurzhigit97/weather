import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/generated/locale_keys.g.dart';

enum City { Bishkek, London, Dubai }

class SelectCityCubit extends Cubit<City> {
  SelectCityCubit() : super(City.Bishkek);
  void select(City city) {
    emit(city);
  }
}

extension OnCity on City {
  String name() {
    if (this == City.Bishkek) {
      return LocaleKeys.cities_bishkek.tr();
    }

    if (this == City.London) {
      return LocaleKeys.cities_london.tr();
    }

    return LocaleKeys.cities_dubai.tr();
  }
}
