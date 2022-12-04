import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/blocs/selected_city_cubit.dart';
import 'package:weather_api/data/repository/weather_repository.dart';

class SearchView extends StatefulWidget {
  const SearchView({
    super.key,
  });

  @override
  State<SearchView> createState() => _SearchState();
}

class _SearchState extends State<SearchView> {
  late final _selecCityCubit = context.read<SelectCityCubit>();

  final weatherService = WeatherRepository();
  final _textfieldController = TextEditingController();
  bool _isLoadinf = false;

  loadingFunc() async {
    try {
      await WeatherRepository().fetchWeatherByCity(_selecCityCubit.state);
      setState(() {
        _isLoadinf = false;
      });
    } catch (e) {
      print(e);
    }
  }

  searchCity(String value) {
    return (setState(() {
      _isLoadinf = true;

      Future.delayed(
        const Duration(seconds: 1),
        () {
          loadingFunc();
          _textfieldController.clear();
        },
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _isLoadinf
            ? const Center(
                child: SizedBox(
                    width: 30, height: 30, child: CircularProgressIndicator()),
              )
            : SizedBox(
                child: TextField(
                  controller: _textfieldController,
                  onSubmitted: (value) => searchCity(value),
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          _textfieldController.clear();
                          FocusScope.of(context).unfocus();
                        },
                        icon: Icon(
                          Icons.clear,
                          color: Color.fromARGB(173, 255, 255, 255),
                        )),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    hintText: 'Search for  cities',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(133, 255, 255, 255)),
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
                ),
              ),
      ],
    );
  }
}
