import 'dart:async';

import 'package:drivers_app/core/const.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final Completer<GoogleMapController> mapcompleter = Completer();
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 700,
          child: GoogleMap(
            initialCameraPosition: kGooglePlex,
            myLocationEnabled: true,
            onMapCreated: (controller) {
              mapcompleter.complete(controller);
              mapController = controller;
            },
          )),
    );
  }
}
