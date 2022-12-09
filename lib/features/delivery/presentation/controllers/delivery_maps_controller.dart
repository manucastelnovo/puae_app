import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:puae_app/core/dependency_injection/locator.dart';
import 'package:puae_app/features/delivery/domain/repositories/location_repository.dart';

class DeliveryMapsController extends ChangeNotifier {
  DeliveryMapsController(this.ref);
  final Ref ref;

  Position? _currentLocation;
  Position? get currentLocation => _currentLocation;

  final LocationService _locationService = locator<LocationService>();

  Future<void> setCurrentLocation() async {
    try {
      Position currentLocation = await _locationService.getCurrentLocation();
      _currentLocation = currentLocation;

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

final deliveryMapsProvider = ChangeNotifierProvider(
  (ref) => DeliveryMapsController(ref),
);
