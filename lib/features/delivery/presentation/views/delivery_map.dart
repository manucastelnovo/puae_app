import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:puae_app/core/widgets/logo.dart';
import 'package:puae_app/features/user/presentation/controllers/login_view_controller.dart';

class DeliveryMapView extends HookConsumerWidget {
  const DeliveryMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewportWidth = MediaQuery.of(context).size.width;
    final viewportHeight = MediaQuery.of(context).size.height;

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
