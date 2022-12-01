import 'package:flutter/material.dart';
import 'package:weather_api/repository/api_repository.dart';

const List<String> list = <String>['Bishkek', 'London', 'Dubai'];

class SelectCityCubit extends StatefulWidget {
  const SelectCityCubit({super.key});

  @override
  State<SelectCityCubit> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCityCubit> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      dropdownColor: Color.fromARGB(255, 87, 166, 215),
      icon: const Icon(
        Icons.arrow_downward,
        color: Colors.white,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          //! for search city by select
          //! got city from weather_service
          city = value;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
    );
  }
}
