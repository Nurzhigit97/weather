import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_api/blocs/selected_city_cubit.dart';
import 'package:weather_api/blocs/weather_fetch_state.dart';
import 'package:weather_api/data/repository/weather_repository.dart';

class WeatherFetchCubit extends Cubit<WeatherState> {
  final WeatherRepository _repository;
  WeatherFetchCubit(this._repository) : super(InitWeatherState());

  Future<void> fetchWeather() async {
    try {
      emit(LoadingWeatherState());
      final response = await _repository.fetchWeather();
      emit(LoadedWeatherState(response));
    } on DioError catch (err) {
      emit(ErrorWeatherState(err.message));
    }
  }

  Future<void> searchWeatherByCity(String city) async {
    try {
      emit(LoadingWeatherState());
      final response = await _repository.searchWeatherByCity(city);
      emit(LoadedWeatherState(response));
    } on DioError catch (err) {
      emit(ErrorWeatherState(err.message));
    }
  }

  Future<void> fetchWeatherByLocation(String city) async {
    try {
      emit(LoadingWeatherState());
      final response = await _repository.searchWeatherByCity(city);
      emit(LoadedWeatherState(response));
    } on DioError catch (err) {
      emit(ErrorWeatherState(err.message));
    }
  }

  Future<void> fetchWeatherByCity(City city) async {
    try {
      emit(LoadingWeatherState());
      final response = await _repository.selectWeatherByCity(city);
      emit(LoadedWeatherState(response));
    } on DioError catch (err) {
      emit(ErrorWeatherState(err.message));
    }
  }
}
