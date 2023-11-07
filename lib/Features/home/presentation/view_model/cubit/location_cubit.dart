import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  static get(context) {
    return BlocProvider.of<LocationCubit>(context);
  }

  getcurrentLocation() async {
    Position currentposition = await Geolocator.getCurrentPosition();
    LatLng currentlatlng =
        LatLng(currentposition.latitude, currentposition.longitude);
    print(currentlatlng);

    emit(CurrentLocationSuccess(latLng: currentlatlng));
  }

  animatcamera(LatLng latLng, GoogleMapController controller) {
    controller.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(target: latLng,zoom: 14)));
    emit(CameraAnimated());
  }
}
