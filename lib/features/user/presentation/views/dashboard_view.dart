import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:puae_app/core/widgets/logo.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DashboardView extends HookConsumerWidget {
  String user;
  DashboardView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Response? response;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 223, 220, 220),
          child: SafeArea(
            child: ListView(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Logo(
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Text(
                      "Bienvenido ${user}",
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox()
                  ],
                ),
                const SizedBox(height: 200),
                Center(child: Text('bienvenido ' + user)),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: ElevatedButton(
                      onPressed: () async {
                        try {
                          response = await Dio().get(
                              "${dotenv.env['SERVER_ADDRESS']}/api/foods/1");
                          print(response);
                        } catch (e) {
                          throw e;
                        }
                      },
                      child: Text('traer menu en la consola')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
