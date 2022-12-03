import 'package:flutter_bloc/flutter_bloc.dart';

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
      return 'Бишкек';
    }

    if (this == City.London) {
      return 'Лондон';
    }

    return 'Дубай';
  }
}
