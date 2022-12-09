import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:puae_app/core/widgets/logo.dart';
import 'package:puae_app/features/delivery/presentation/controllers/helpers.dart';
import 'package:puae_app/features/user/presentation/controllers/login_view_controller.dart';
import 'package:puae_app/main.dart';

class DeliveryMapView extends HookConsumerWidget {
  DeliveryMapView({Key? key}) : super(key: key);

  late MapboxMapController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewportWidth = MediaQuery.of(context).size.width;
    final viewportHeight = MediaQuery.of(context).size.height;
    // LatLng latLng = getLatLngFromSharedPrefs();
    late CameraPosition _initialCameraPosition;

    _initialCameraPosition = const CameraPosition(
      target: LatLng(25.204849, 55.270782),
      zoom: 15,
    );

    _onMapCreated(MapboxMapController controller) async {
      this.controller = controller;
    }

    _onStyleLoadedCallback() async {}

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
                      child: const Center(
                        child: Text(
                          "Map",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 58,
                            color: Color.fromRGBO(255, 63, 18, 1),
                          ), // 4, 178, 217, 1
                        ),
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
