import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:puae_app/core/widgets/charts.dart';
import 'package:puae_app/core/widgets/logo.dart';
import 'package:puae_app/features/user/presentation/controllers/dashboard_controller.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
    required this.user,
    required this.dashboardController,
    required this.menu,
  }) : super(key: key);

  final String user;
  final DashboardViewController dashboardController;
  final String? menu;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  "Bienvenido ${widget.user}",
                  style: const TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox()
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Card(
              child: SizedBox(
                  height: 200,
                  width: 50,
                  child: SimpleBarChart(widget.dashboardController.seriesList,
                      animate: true)),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                  onPressed: () async {
                    try {
                      // response = await Dio().get(
                      //     "${dotenv.env['SERVER_ADDRESS']}/api/foods/1");
                      // print(response);
                      // menu = response.toString();
                    } catch (e) {
                      throw e;
                    }
                  },
                  child: const Text('traer menu en la consola')),
            ),
            Center(
              child: Text(widget.menu == null ? 'hola mundo' : widget.menu!),
            )
          ],
        ),
      ),
    );
  }
}
