import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/library.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:puae_app/core/dependency_injection/locator.dart';
import 'package:puae_app/features/delivery/domain/repositories/location_repository.dart';

class TurnByTurnController extends ChangeNotifier {
  TurnByTurnController(this.ref);
  final Ref ref;

  late double _distanceRemaining;

  late double _durationRemaining;

  late MapBoxNavigationViewController _controller;

  MapBoxNavigationViewController get controller => _controller;

  final _options = MapBoxOptions(

      // initialLatitude: 36.1175275,
      // initialLongitude: -115.1839524,
      zoom: 13.0,
      tilt: 0.0,
      bearing: 0.0,
      enableRefresh: false,
      alternatives: true,
      voiceInstructionsEnabled: true,
      bannerInstructionsEnabled: true,
      allowsUTurnAtWayPoints: true,
      mode: MapBoxNavigationMode.drivingWithTraffic,
      units: VoiceUnits.imperial,
      simulateRoute: true,
      language: "en");

  late bool? _arrived;

  late String? _instruction;

  late bool _routeBuilt;

  late bool _isNavigating;

  late bool _isMultipleStop;

  late MapBoxNavigation directions =
      MapBoxNavigation(onRouteEvent: onRouteEvent);

  MapBoxOptions get options => _options;

  Future<void> onRouteEvent(e) async {
    // _distanceRemaining = await directions.distanceRemaining;
    // _durationRemaining = await directions.durationRemaining;

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
          await directions.finishNavigation();
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
    notifyListeners();
  }
}

final turnByTurnProvider = ChangeNotifierProvider(
  (ref) => TurnByTurnController(ref),
);
