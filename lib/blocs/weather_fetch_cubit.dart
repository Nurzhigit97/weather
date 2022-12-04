import 'package:bloc/bloc.dart';
import 'package:weather_api/blocs/selected_city_cubit.dart';
import 'package:weather_api/blocs/weather_fetch_state.dart';
import 'package:weather_api/data/repository/weather_repository.dart';

class WeatherFetchCubit extends Cubit<WeatherState> {
  final WeatherRepository _repository;

  WeatherFetchCubit(this._repository) : super(InitWeatherState());

  Future<void> fetchWeather(City city) async {
    emit(LoadingWeatherState());
    try {
      emit(LoadingWeatherState());
      final response = await _repository.fetchWeatherByCity(city);
      emit(LoadedWeatherState(response));
    } catch (err) {
      emit(ErrorWeatherState(err.toString()));
    }
  }
}
