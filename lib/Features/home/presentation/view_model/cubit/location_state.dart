part of 'location_cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationFailed extends LocationState {
  final String errmessage;

  LocationFailed({required this.errmessage});
}

final class CurrentLocationSuccess extends LocationState {
  final LatLng latLng;

  CurrentLocationSuccess({required this.latLng});
}

final class CameraAnimated extends LocationState {}
