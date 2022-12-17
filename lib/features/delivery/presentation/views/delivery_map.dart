import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:puae_app/core/widgets/logo.dart';
import 'package:puae_app/features/delivery/presentation/controllers/delivery_maps_controller.dart';
import 'package:puae_app/features/delivery/presentation/views/turn_by_turn.dart';

class DeliveryMapView extends HookConsumerWidget {
  DeliveryMapView({Key? key}) : super(key: key);

  late MapboxMapController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewportWidth = MediaQuery.of(context).size.width;
    final viewportHeight = MediaQuery.of(context).size.height;

    late CameraPosition _initialCameraPosition;

    ref.read(deliveryMapsProvider).setCurrentLocation();

    Position? _currentPosition =
        ref.watch(deliveryMapsProvider).currentLocation;

    _initialCameraPosition = CameraPosition(
      // target: LatLng(_currentPosition!.latitude, _currentPosition.longitude),
      target: LatLng(
        25.303472,
        -57.58389,
      ),
      zoom: 20,
    );

    _onMapCreated(MapboxMapController controller) async {
      this.controller = controller;
    }

    _onStyleLoadedCallback() async {}

    _addSourceAndLineLayer(int index, bool removeLayer) async {
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
      await controller.addSource(
          "fills", GeojsonSourceProperties(data: _fills));
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 223, 220, 220),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: viewportHeight * 0.02,
                          left: viewportWidth * 0.05),
                      child: const Logo(
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Container(
                      width: viewportWidth * 0.8,
                      padding: EdgeInsets.only(
                          top: viewportHeight * 0.02,
                          left: viewportWidth * 0.05),
                      child: Row(
                        children: [
                          const Text(
                            "Map",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 58,
                              color: Color.fromRGBO(255, 63, 18, 1),
                            ), // 4, 178, 217, 1
                          ),
                          SizedBox(
                            width: viewportWidth * 0.1,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              _addSourceAndLineLayer(0, true);
                              print(_currentPosition!.latitude.toString() +
                                  " " +
                                  _currentPosition.longitude.toString());

                              ref
                                  .read(deliveryMapsProvider)
                                  .addOriginMarker(LatLng(
                                    -25.303472,
                                    -57.58389,
                                  ));
                            },
                            child: const Text("ruta"),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        TurnByTurnView(),
                                  ),
                                );
                              },
                              child: Text('turn'))
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: MapboxMap(
                    accessToken:
                        'pk.eyJ1IjoibWFudWNhc3RlbG5vdm8iLCJhIjoiY2xiY2hncDd1MDNqNTNvcDNqa2ZrYzA2MyJ9.YCj4H_VyhpkNa99JBfw4Jw',
                    initialCameraPosition: _initialCameraPosition,
                    onMapCreated: _onMapCreated,
                    onStyleLoadedCallback: _onStyleLoadedCallback,
                    myLocationEnabled: true,
                    myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
                    minMaxZoomPreference: const MinMaxZoomPreference(14, 17),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
