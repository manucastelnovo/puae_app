import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/library.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:puae_app/features/delivery/presentation/controllers/turn_by_turn_controller.dart';

class TurnByTurnView extends StatefulHookConsumerWidget {
  const TurnByTurnView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TurnByTurnViewState();
}

class _TurnByTurnViewState extends ConsumerState<TurnByTurnView> {
  List<WayPoint> wayPoints = [
    WayPoint(name: "City Hall", latitude: 42.886448, longitude: -78.878372),
    WayPoint(
        name: "Downtown Buffalo", latitude: 42.8866177, longitude: -78.8814924)
  ];

  @override
  Widget build(BuildContext context) {
    final options = ref.read(turnByTurnProvider).options;

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
                      await ref
                          .read(turnByTurnProvider)
                          .directions
                          .startNavigation(
                              wayPoints: wayPoints, options: options);
                    },
                    child: const Text('turnbyturn ')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
