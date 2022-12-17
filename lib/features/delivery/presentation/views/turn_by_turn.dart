import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/library.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class TurnByTurnView extends StatefulWidget {
  TurnByTurnView({Key? key}) : super(key: key);

  @override
  State<TurnByTurnView> createState() => _TurnByTurnViewState();
}

class _TurnByTurnViewState extends State<TurnByTurnView> {
  late MapboxMapController controller;

  double? _distanceRemaining;
  MapBoxNavigation? _directions;

  double? _durationRemaining;

  bool? _arrived;

  String? _instruction;

  bool? _routeBuilt;

  bool? _isNavigating;

  bool _isMultipleStop = false;

  final cityhall =
      WayPoint(name: "City Hall", latitude: 42.886448, longitude: -78.878372);
  final downtown = WayPoint(
      name: "Downtown Buffalo", latitude: 42.8866177, longitude: -78.8814924);

  final List<WayPoint> wayPoints = [
    WayPoint(name: "City Hall", latitude: 42.886448, longitude: -78.878372),
    WayPoint(
        name: "Downtown Buffalo", latitude: 42.8866177, longitude: -78.8814924)
  ];

  @override
  Widget build(BuildContext context) {
    final _options = MapBoxOptions(
        initialLatitude: 36.1175275,
        initialLongitude: -115.1839524,
        zoom: 13.0,
        tilt: 0.0,
        bearing: 0.0,
        enableRefresh: false,
        alternatives: true,
        voiceInstructionsEnabled: true,
        bannerInstructionsEnabled: true,
        allowsUTurnAtWayPoints: true,
        mode: MapBoxNavigationMode.drivingWithTraffic,
        mapStyleUrlDay: "https://url_to_day_style",
        mapStyleUrlNight: "https://url_to_night_style",
        units: VoiceUnits.imperial,
        simulateRoute: true,
        language: "en");

    Future<void> _onRouteEvent(e) async {
      _distanceRemaining = await _directions!.distanceRemaining;
      _durationRemaining = await _directions!.durationRemaining;

      switch (e.eventType) {
        case MapBoxEvent.progress_change:
          var progressEvent = e.data as RouteProgressEvent;
          _arrived = progressEvent.arrived;
          if (progressEvent.currentStepInstruction != null)
            _instruction = progressEvent.currentStepInstruction;
          break;
        case MapBoxEvent.route_building:
        case MapBoxEvent.route_built:
          _routeBuilt = true;
          break;
        case MapBoxEvent.route_build_failed:
          _routeBuilt = false;
          break;
        case MapBoxEvent.navigation_running:
          _isNavigating = true;
          break;
        case MapBoxEvent.on_arrival:
          _arrived = true;
          if (!_isMultipleStop) {
            await Future.delayed(Duration(seconds: 3));
            await _directions!.finishNavigation();
          } else {}
          break;
        case MapBoxEvent.navigation_finished:
        case MapBoxEvent.navigation_cancelled:
          _routeBuilt = false;
          _isNavigating = false;
          break;
        default:
          break;
      }
      //refresh UI
      setState(() {});
    }

    initState() {
      _directions = MapBoxNavigation(onRouteEvent: _onRouteEvent);
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
                ElevatedButton(
                    onPressed: () async {
                      await _directions!.startNavigation(
                          wayPoints: wayPoints, options: _options);
                    },
                    child: const Text('turnbyturn'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
