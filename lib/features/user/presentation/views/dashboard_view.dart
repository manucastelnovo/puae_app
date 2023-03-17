import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:puae_app/core/widgets/charts.dart';
import 'package:puae_app/core/widgets/logo.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:puae_app/features/user/presentation/controllers/dashboard_controller.dart';
import 'package:puae_app/features/user/presentation/views/home_view.dart';

class DashboardView extends HookConsumerWidget {
  String user;
  String? menu;
  DashboardView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardController = ref.watch(dashboardViewProvider);
    Response? response;
    final _selectedIndex = dashboardController.selectedIndex;

    List<Widget> _widgetOptions = <Widget>[
      Home(user: user, dashboardController: dashboardController, menu: menu),
      const Text(
        'Index 1: chat bot',
      ),
      const Text(
        'Index 2: School',
      ),
    ];

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex!),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat Ai',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: dashboardController.onItemTapped),
      ),
    );
  }
}
