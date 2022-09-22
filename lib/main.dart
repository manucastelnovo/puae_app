import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:puae_app/features/user/presentation/views/login_view.dart';

import 'core/dependency_injection/locator.dart';

void main() {
  setupLocator();
  runApp(
    const
    // Para que los widgets puedan leer los providers, necesitamos envolver
    // toda la aplicación en un `ProviderScope`.
    // Aquí es donde se almacenará el estado de nuestros providers.
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: const Scaffold(
        body: LoginView(),
      ),
    );
  }
}
