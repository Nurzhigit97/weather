import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_api/repository/api_repository.dart';

class GetByLocation extends StatefulWidget {
  GetByLocation({Key? key}) : super(key: key);

  @override
  State<GetByLocation> createState() => _GetByLocationState();
}

class _GetByLocationState extends State<GetByLocation> {
  String locationMsg = "Current Loc";
  String? lat;
  String? long;

  Future<Position> getCorrentLOcation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services  are disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Loaction permission are permanently denied, we cannot request permission');
    }
    return await Geolocator.getCurrentPosition();
  }

  void liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high, distanceFilter: 100);

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();
    });

    setState(() {
      city = "$lat,$long";
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          getCorrentLOcation().then((value) {
            lat = '${value.latitude}';
            long = '${value.longitude}';
            setState(() {
              city = "$lat,$long";
              print("$lat $long");
            });
            //! for listen location update
            liveLocation();
          });
        },
        icon: Icon(Icons.location_on_outlined));
  }
}
