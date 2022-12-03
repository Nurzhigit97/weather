import 'package:bloc/bloc.dart';
import 'package:weather_api/blocs/selected_city_cubit.dart';
import 'package:weather_api/blocs/weather_fetch_state.dart';
import 'package:weather_api/data/reposotory/api_repository.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _repository;

  WeatherCubit(this._repository) : super(InitWeatherState());

  Future<void> fetchWeather(City city) async {
    emit(LoadingWeatherState());
    try {
      emit(LoadingWeatherState());
      final response = await _repository.getAll(city);
      emit(ResponseWeatherState(response));
    } catch (e) {
      emit(ErrorWeatherState(e.toString()));
    }
  }
}
