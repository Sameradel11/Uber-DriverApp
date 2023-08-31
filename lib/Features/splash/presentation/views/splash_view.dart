import 'dart:async';

import 'package:drivers_app/Features/home/presentation/views/main_view.dart';
import 'package:drivers_app/Features/splash/presentation/views/const.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(KlogoPath),
        const Text(
          "Welcome To Drivers App",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }

  startTimer() {
    Timer(const Duration(seconds: 2), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainView()));
    });
  }
}
