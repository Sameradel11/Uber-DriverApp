import 'dart:async';
import 'package:drivers_app/Features/home/presentation/view_model/assisted_methods.dart';
import 'package:drivers_app/Features/home/presentation/view_model/cubit/location_cubit.dart';
import 'package:drivers_app/core/const.dart';
import 'package:drivers_app/core/functions.dart';
import 'package:drivers_app/core/style.dart';
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
  Color backgroundcolor = Colors.black87.withOpacity(0.5);
  Color textcolor = Colors.black;
  bool isonline = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state is LatlngUpdated) {
          LocationCubit cubit = LocationCubit.get(context);
          animatcamera(cubit.currentlatlng, mapcontroller!);
        }
      },
      builder: (context, state) {
        LocationCubit cubit = LocationCubit.get(context);
        return Stack(children: [
          GoogleMap(
            initialCameraPosition: kGooglePlex,
            myLocationEnabled: true,
            onMapCreated: (controller) async {
              mapcompleter.complete(controller);
              mapcontroller = await mapcompleter.future;
              // ignore: use_build_context_synchronously
              await getPermission(cubit, context);
            },
          ),
          isonline
              ? Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.sizeOf(context).height * 0.03,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          actionsPadding:
                              const EdgeInsets.only(right: 8, bottom: 21),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          title: const Text("Do you want to go Offline"),
                          actions: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Cancel",
                                style: Style.textstyle16,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.driverGoOffline();
                                isonline = !isonline;
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: const Text(
                                "Yes",
                                style: Style.textstyle16,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Online",
                          style: Style.textstyle20.copyWith(
                              color: textcolor, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.drive_eta,
                          color: Colors.black,
                          size: 30,
                        ),
                      ],
                    ),
                  )) 
              : Container(
                  color: backgroundcolor,
                  height: MediaQuery.sizeOf(context).height,
                  width: double.infinity,
                  child: Positioned(
                    top: MediaQuery.sizeOf(context).height * 0.45,
                    left: 0,
                    right: 0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              isonline = !isonline;
                              cubit.driverGoOnline();
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 21, vertical: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                            child: Text(
                              "Go Online",
                              style:
                                  Style.textstyle18.copyWith(color: textcolor),
                            ),
                          )
                        ]),
                  ),
                ),
        ]);
      },
    );
  }

  Future<void> getPermission(LocationCubit cubit, BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        cubit.getCurrentLocation(mapcontroller!);
        traceDriverLocation(context);

      } else {
        showsnackbar("The Program Won't Start without permission", context);
      }
    } else {
      cubit.getCurrentLocation(mapcontroller!);
        traceDriverLocation(context);

    }
  }
}
