import 'package:flutter/material.dart';
import 'package:weather_api/cubits/weatherFetchCubit/getByLocationCubit/location.dart';
import 'package:weather_api/repository/api_repository.dart';

class GetByLocationView extends StatefulWidget {
  GetByLocationView({Key? key}) : super(key: key);

  @override
  State<GetByLocationView> createState() => _GetByLocationState();
}

class _GetByLocationState extends State<GetByLocationView> {
  @override
  Widget build(BuildContext context) {
    double? lat;
    double? long;
    return IconButton(
        onPressed: () async {
          final res = await Location().getCorrentLocation();
          lat = await res.latitude;
          long = await res.longitude;
          setState(() {
            city = "${lat},${long}";
            print("$lat $long");
            //! for listen location update
            Location().liveLocation();
            setState(() {
              city = "$lat,$long";
            });
          });
        },
        icon: Icon(Icons.location_on_outlined));
  }
}
