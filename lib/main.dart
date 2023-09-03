import 'package:drivers_app/core/app_routes.dart';
import 'package:drivers_app/core/bloc_observer.dart';
import 'package:drivers_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const DriverApp());
  Bloc.observer = Observer();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class DriverApp extends StatelessWidget {
  const DriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      title: "Drivers App",
    );
  }
}
