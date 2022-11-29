import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitide;
  String apiKey = 'c8a70185a0c34463b4f171826222311';
  int? status;

  /// async and await are used for time consuming tasks
  /// Get your current loatitude and longitude
  /// Location accuracy depends on the type of app high,low ,
  /// high accuracy also result in more power consumed
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitide = position.longitude;
      print('lat: $latitude');
      print('lon: $longitide');
    } catch (e) {
      print(e);
    }
  }
}
