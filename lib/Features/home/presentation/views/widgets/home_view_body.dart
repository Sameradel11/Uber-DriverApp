import 'dart:async';

import 'package:drivers_app/Features/home/presentation/view_model/cubit/location_cubit.dart';
import 'package:drivers_app/core/const.dart';
import 'package:drivers_app/core/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final Completer<GoogleMapController> mapcompleter = Completer();
  GoogleMapController? mapcontroller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state is CurrentLocationSuccess) {
          LocationCubit cubit = LocationCubit.get(context);
          cubit.animatcamera(state.latLng, mapcontroller!);
        }
        if (state is CameraAnimated) {
          showsnackbar("Camera Animated", context);
        }
      },
      builder: (context, state) {
        LocationCubit cubit = LocationCubit.get(context);
        return GoogleMap(
          initialCameraPosition: kGooglePlex,
          myLocationEnabled: true,
          onMapCreated: (controller) async {
            mapcompleter.complete(controller);
            mapcontroller = await mapcompleter.future;
            LocationPermission permission = await Geolocator.checkPermission();
            if (permission == LocationPermission.denied||permission == LocationPermission.deniedForever) {
              permission = await Geolocator.requestPermission();
              if (permission == LocationPermission.always ||
                  permission == LocationPermission.whileInUse) {
                cubit.getcurrentLocation();
              } else {
                showsnackbar(
                    "The Program Won't Start without permission", context);
              }
            } else {
              cubit.getcurrentLocation();
            }
          },
        );
      },
    );
  }
}
