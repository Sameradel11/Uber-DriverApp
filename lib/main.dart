import 'package:drivers_app/core/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DriverApp());
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
