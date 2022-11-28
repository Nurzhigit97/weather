import 'package:flutter/material.dart';
import 'package:weather_api/services/weather_service.dart';

const List<String> list = <String>['Bishkek', 'London', 'Dubai'];

class SelectCity extends StatefulWidget {
  const SelectCity({super.key});

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_downward,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          //! for search city by select
          city = value;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
          ),
        );
      }).toList(),
    );
  }
}
