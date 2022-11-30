import 'package:bloc/bloc.dart';
import 'package:weather_api/cubits/weatherFetchCubit/weather_fetch_state.dart';
import 'package:weather_api/repository/api_repository.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _repository;

  WeatherCubit(this._repository) : super(InitWeatherState());

  Future<void> fetchWeather() async {
    emit(LoadingWeatherState());
    try {
      final response = await _repository.getAll();
      emit(ResponseWeatherState(response));
    } catch (e) {
      emit(ErrorWeatherState(e.toString()));
    }
  }
}
