import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:puae_app/features/delivery/domain/repositories/location_repository.dart';

class LocationServiceImplementation implements LocationService {
  final Dio _dio = Dio();
  @override
  Future<Position> getCurrentLocation(
      {LocationAccuracy desiredAccuracy = LocationAccuracy.best}) async {
    try {
      Position? position = await Geolocator.getLastKnownPosition();
      position ??= await Geolocator.getCurrentPosition();
      return position;
    } on PermissionDeniedException {
      throw const PermissionDeniedException("Could not get current location");
    } catch (e) {
      throw e;
    }
  }
}
