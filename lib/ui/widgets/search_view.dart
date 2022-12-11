import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/blocs/weather_fetch_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.locale;
    final weatherCubit = context.read<WeatherFetchCubit>();
    final inputController = TextEditingController();

    return TextField(
      controller: inputController,
      onEditingComplete: () {
        if (inputController.text.isEmpty) return;
        weatherCubit.searchWeatherByCity(
          inputController.text.toLowerCase(),
        );

        inputController.text = '';
      },
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontStyle: FontStyle.italic,
      ),
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        hintText: 'Search for  cities',
        hintStyle: const TextStyle(color: Color.fromARGB(133, 255, 255, 255)),
        filled: true,
        fillColor: const Color.fromARGB(18, 255, 255, 255),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
