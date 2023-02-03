import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  String user;
  DashboardView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 200),
            Center(child: Text('bienvenido ' + user)),
          ],
        ),
      ),
    );
  }
}
