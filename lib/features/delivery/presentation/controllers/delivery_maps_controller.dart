import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:puae_app/core/dependency_injection/locator.dart';
import 'package:puae_app/features/delivery/domain/repositories/location_repository.dart';

class DeliveryMapsController extends ChangeNotifier {
  DeliveryMapsController(this.ref);
  final Ref ref;

  Position? _currentLocation;
  Position? get currentLocation => _currentLocation;

  final LocationService _locationService = locator<LocationService>();

  late MapboxMapController _mapController;

  late List<Symbol> _markers;

  Future<void> setCurrentLocation() async {
    try {
      Position currentLocation = await _locationService.getCurrentLocation();
      _currentLocation = currentLocation;

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<Symbol> addDestinationMarker(LatLng destinationLocation) async {
    print('message: ${destinationLocation.toString()}');

    final Symbol marker = await _mapController.addSymbol(
      SymbolOptions(
        geometry: destinationLocation,
        iconImage: Icons.flag_outlined.toString(),
        iconSize: 2.0,
        iconOffset: const Offset(-0.1, -7.5),
      ),
    );

    return marker;
  }

  Future<Symbol> addOriginMarker(LatLng originLocation) async {
    final Symbol marker = await _mapController.addSymbol(
      SymbolOptions(
        geometry: originLocation,
        iconImage: 'assets/images/my_location_filled.svg',
        iconSize: 1.3,
      ),
    );

    _markers.add(marker);

    return marker;
  }

  Future<void> removeSourceAndLineLayer() async {
    await _mapController.removeLayer('lines');
    await _mapController.removeSource('fills');
    // if (_markers.isNotEmpty) await _mapController.removeSymbols(_markers);
  }

  Future<void> addSourceAndLineLayer(Map geometry) async {
    final _fills = {
      'type': "FeatureCollection",
      'features': [
        {
          'type': 'Feature',
          'id': 0,
          'properties': <String, dynamic>{},
          'geometry': geometry
        }
      ]
    };

    await removeSourceAndLineLayer();

    await _mapController.addSource(
        'fills',
        GeojsonSourceProperties(
          data: _fills,
        ));

    await _mapController.addLineLayer(
        'fills',
        'lines',
        LineLayerProperties(
          lineColor: Colors.blue.toHexStringRGB(),
          lineCap: 'round',
          lineJoin: 'round',
          lineWidth: 5.0,
        ));
  }
}

final deliveryMapsProvider = ChangeNotifierProvider(
  (ref) => DeliveryMapsController(ref),
);
