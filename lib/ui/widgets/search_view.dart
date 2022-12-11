import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_api/blocs/weather/weather_fetch_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.locale;
    final weatherCubit = context.read<WeatherFetchCubit>();
    final inputController = TextEditingController();

    return TextField(
      controller: inputController,
      onEditingComplete: () async {
        final text = inputController.text;
        if (text.isEmpty) return;
        //! for save in cash and get from fetchweather
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('cityName', text);

        weatherCubit.searchWeatherByCity(
          text,
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
