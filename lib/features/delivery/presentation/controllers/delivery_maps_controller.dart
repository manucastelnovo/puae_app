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

  late MapboxMapController controller;

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

  onMapCreated(MapboxMapController controller) async {
    this.controller = controller;
  }

  onStyleLoadedCallback() async {}

  Future<void> removeSourceAndLineLayer() async {
    await _mapController.removeLayer('lines');
    await _mapController.removeSource('fills');
    // if (_markers.isNotEmpty) await _mapController.removeSymbols(_markers);
  }

  Future<void> _addSourceAndLineLayer(Map geometry) async {
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

  Future<void> addSourceAndLineLayer(int index, bool removeLayer) async {
    // Can animate camera to focus on the item
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(
      -25.303472,
      -57.58389,
    ))));

    // Add a polyLine between source and destination
    Map geometry = {
      "type": "LineString",
      "coordinates": [
        [-57.58389, -25.303472],
        [-57.583468, -25.303676],
        [-57.582592, -25.304078],
        [-57.582569, -25.304088],
        [-57.582477, -25.304129],
        [-57.582826, -25.304703],
        [-57.582872, -25.304681],
        [-57.5829, -25.304669],
        [-57.582976, -25.304633],
        [-57.583043, -25.304765],
        [-57.583149, -25.30497],
        [-57.583209, -25.305098],
        [-57.583211, -25.305114],
        [-57.583206, -25.305129],
        [-57.583197, -25.305146],
        [-57.583169, -25.305168],
        [-57.583166, -25.305169],
        [-57.583123, -25.305192],
        [-57.583141, -25.305224],
        [-57.583102, -25.305248],
        [-57.583053, -25.305275],
        [-57.58297, -25.305316],
        [-57.582338, -25.305625],
        [-57.581237, -25.306144],
        [-57.580496, -25.306511],
        [-57.580205, -25.306665],
        [-57.579942, -25.30675],
        [-57.579822, -25.306865],
        [-57.579103, -25.30778],
        [-57.579525, -25.30872],
        [-57.579739, -25.309264],
        [-57.579939, -25.309744],
        [-57.580021, -25.309942],
        [-57.580354, -25.310742],
        [-57.580555, -25.311223],
        [-57.580771, -25.311745],
        [-57.580829, -25.31188],
        [-57.581095, -25.312519],
        [-57.58119, -25.312746],
        [-57.580028, -25.313136],
        [-57.578593, -25.313615],
        [-57.579059, -25.314703],
        [-57.579071, -25.314742],
        [-57.579093, -25.314797],
        [-57.579124, -25.314881],
        [-57.579237, -25.315038],
        [-57.579821, -25.315848],
        [-57.579836, -25.315869],
        [-57.579888, -25.315962],
        [-57.579933, -25.316065],
        [-57.579936, -25.31608],
        [-57.579949, -25.31616],
        [-57.579946, -25.316288],
        [-57.579987, -25.31628],
        [-57.5801, -25.316256],
        [-57.580153, -25.316241],
        [-57.580332, -25.316187],
        [-57.580541, -25.316108],
        [-57.580774, -25.316092],
        [-57.580782, -25.316094],
        [-57.580988, -25.316124],
        [-57.581103, -25.316168],
        [-57.581187, -25.3162],
        [-57.581289, -25.316291],
        [-57.581339, -25.316418],
        [-57.581313, -25.316685],
        [-57.581307, -25.316748],
        [-57.581296, -25.316839],
        [-57.581276, -25.317003]
      ]
    };
    final _fills = {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "id": 0,
          "properties": <String, dynamic>{},
          "geometry": geometry,
        },
      ],
    };

    // Remove lineLayer and source if it exists
    if (removeLayer == true) {
      await controller.removeLayer("lines");
      await controller.removeSource("fills");
    }

    // Add new source and lineLayer
    await controller.addSource("fills", GeojsonSourceProperties(data: _fills));
    await controller.addLineLayer(
      "fills",
      "lines",
      LineLayerProperties(
        lineColor: Color.fromARGB(255, 190, 27, 27).toHexStringRGB(),
        lineCap: "round",
        lineJoin: "round",
        lineWidth: 2,
      ),
    );
  }
}

final deliveryMapsProvider = ChangeNotifierProvider(
  (ref) => DeliveryMapsController(ref),
);
