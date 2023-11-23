
import 'package:bloc/bloc.dart';
import 'package:drivers_app/Features/home/presentation/view_model/assisted_methods.dart';
import 'package:drivers_app/core/const.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  late LatLng currentlatlng;
  static get(context) {
    return BlocProvider.of<LocationCubit>(context);
  }

  getcurrentLocation() async {
    Position currentposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentlatlng = LatLng(currentposition.latitude, currentposition.longitude);
    print(currentlatlng);

    emit(CurrentLocationSuccess(latLng: currentlatlng));
  }

  animatcamera(LatLng latLng, GoogleMapController controller) {
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 14)));
    emit(CameraAnimated());
  }

  driverGoOnline() {
    setfirebaseLocation(currentlatlng);

    DatabaseReference ref = FirebaseDatabase.instance
        .ref("drivers")
        .child(firebaseAuth.currentUser!.uid)
        .child("status");
    ref.set("available");
  }

  driverGoOffline() {
    Geofire.removeLocation(firebaseAuth.currentUser!.uid);
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("drivers")
        .child(firebaseAuth.currentUser!.uid)
        .child("status");
    ref.set("offline");
  }

  
}
