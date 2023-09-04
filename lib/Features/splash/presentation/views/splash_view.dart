import 'dart:async';
import 'package:drivers_app/const.dart';
import 'package:drivers_app/core/app_routes.dart';
import 'package:drivers_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MySplashView extends StatefulWidget {
  const MySplashView({super.key});

  @override
  State<MySplashView> createState() => _MySplashViewState();
}

class _MySplashViewState extends State<MySplashView> {
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

  startTimer() async {
    Timer(const Duration(seconds: 2), () async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      if (FirebaseAuth.instance.currentUser != null) {
        GoRouter.of(context).pushReplacement(AppRoutes.Kmainview);
      } else {
        GoRouter.of(context).pushReplacement(AppRoutes.KSignIn);
      }
    });
  }
}
