import 'package:drivers_app/Features/Autentication/presentation/views/signin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DriverApp());
}

class DriverApp extends StatelessWidget {
  const DriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: const SignIN(),
      title: "Drivers App",
    );
  }
}
