import 'package:drivers_app/core/const.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void setfirebaseLocation(LatLng latLng) {
  Geofire.initialize("ActiveDrivers");
  Geofire.setLocation(
      firebaseAuth.currentUser!.uid, latLng.latitude, latLng.longitude);
}

traceDriverLocation() {
  Geolocator.getPositionStream().listen((Position position) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("drivers/${firebaseAuth.currentUser!.uid}/status");

    DatabaseEvent event = await ref.once();
    String status = event.snapshot.value.toString();
    if (status != "offline") {
      setfirebaseLocation(LatLng(position.latitude, position.longitude));
    }
  });
}
