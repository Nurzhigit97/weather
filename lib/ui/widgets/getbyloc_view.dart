import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/blocs/weather_fetch_cubit.dart';
import 'package:weather_api/resources/location.dart';

class GetByLocationView extends StatelessWidget {
  GetByLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherCubit = context.read<WeatherFetchCubit>();
    final location = Location();
    return IconButton(
        onPressed: () async {
          final currentLocation = await location.getCorrentLocation();
          final lat = await currentLocation.latitude;
          final long = await currentLocation.longitude;
          final resLocation = '$lat,$long';
          weatherCubit.searchWeatherByCity(resLocation);
        },
        icon: Icon(Icons.location_on_outlined));
  }
}
