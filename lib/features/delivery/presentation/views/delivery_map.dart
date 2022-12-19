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
      target: LatLng(_currentPosition!.latitude, _currentPosition.longitude),
      zoom: 20,
    );

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
                              ref
                                  .read(deliveryMapsProvider)
                                  .addSourceAndLineLayer(0, true);
                              print(_currentPosition!.latitude.toString() +
                                  " " +
                                  _currentPosition.longitude.toString());

                              ref
                                  .read(deliveryMapsProvider)
                                  .addOriginMarker(const LatLng(
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
                                        const TurnByTurnView(),
                                  ),
                                );
                              },
                              child: const Text('turn'))
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
                    onMapCreated: ref.read(deliveryMapsProvider).onMapCreated,
                    onStyleLoadedCallback:
                        ref.read(deliveryMapsProvider).onStyleLoadedCallback,
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
