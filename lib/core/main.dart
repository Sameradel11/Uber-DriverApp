import 'package:drivers_app/Features/Autentication/presentation/view_model/cubits/authcubit/auth_cubit.dart';
import 'package:drivers_app/Features/home/presentation/view_model/cubit/location_cubit.dart';
import 'package:drivers_app/Features/profile/presentation/view_model/cubit/fetchuserdata_cubit.dart';
import 'package:drivers_app/core/app_routes.dart';
import 'package:drivers_app/core/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const DriverApp());
  Bloc.observer = Observer();
}

class DriverApp extends StatelessWidget {
  const DriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => LocationCubit(),
        ),
        BlocProvider(create: (context)=>FetchuserdataCubit())
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        theme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        title: "Drivers App",
      ),
    );
  }
}
