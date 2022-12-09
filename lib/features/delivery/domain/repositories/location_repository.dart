import 'package:geolocator/geolocator.dart';

abstract class LocationService {
  Future<Position> getCurrentLocation(
      {LocationAccuracy desiredAccuracy = LocationAccuracy.best});
}
