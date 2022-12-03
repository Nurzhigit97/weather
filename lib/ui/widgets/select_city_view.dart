import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/blocs/selected_city_cubit.dart';
import 'package:weather_api/blocs/weather_fetch_cubit.dart';

class SelectCityView extends StatelessWidget {
  const SelectCityView({super.key});

  @override
  Widget build(BuildContext context) {
    /// получаем кубиты из контекста

    final weatherCubit = context.read<WeatherCubit>();
    final selecCityCubit = context.watch<SelectCityCubit>();
    final selectedCity = selecCityCubit.state;

    return DropdownButton<City>(
      value: selectedCity,
      dropdownColor: Color.fromARGB(255, 87, 166, 215),
      icon: const Icon(
        Icons.arrow_downward,
        color: Colors.white,
      ),
      onChanged: (City? value) {
        if (value == null) return;
        selecCityCubit.select(value);
        weatherCubit.fetchWeather(value);
      },
      items: City.values.map<DropdownMenuItem<City>>((City value) {
        return DropdownMenuItem<City>(
          value: value,
          child: Text(
            value.name(),
            style: TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
    );
  }
}