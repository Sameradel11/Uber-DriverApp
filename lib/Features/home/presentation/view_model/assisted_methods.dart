import 'package:drivers_app/Features/home/presentation/view_model/cubit/location_cubit.dart';
import 'package:drivers_app/core/const.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


void setfirebaseLocation(LatLng latLng) {
  Geofire.initialize("ActiveDrivers");
  Geofire.setLocation(
      firebaseAuth.currentUser!.uid, latLng.latitude, latLng.longitude);
}

Future<LatLng> getcurrentLatlng() async {
  Position currentposition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  LatLng currentlatlng =
      LatLng(currentposition.latitude, currentposition.longitude);
  print(currentlatlng);
  return currentlatlng;
}

animatcamera(LatLng latLng, GoogleMapController controller) {
  controller.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: latLng, zoom: 14)));
}

traceDriverLocation(BuildContext context) {
  Geolocator.getPositionStream().listen((Position position) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("drivers/${firebaseAuth.currentUser!.uid}/status");
    DatabaseEvent event = await ref.once();
    String status = event.snapshot.value.toString();
    if (status != "offline") {
      LatLng newlatlng=LatLng(position.latitude,position.longitude);
      setfirebaseLocation(LatLng(position.latitude, position.longitude));
      BlocProvider.of<LocationCubit>(context).updateLatlng(newlatlng);
    }
  });
}
