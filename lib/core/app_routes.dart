// ignore_for_file: constant_identifier_names
import 'package:drivers_app/Features/Autentication/presentation/views/signin.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/car_details.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/signup.dart';
import 'package:drivers_app/Features/earning/presentation/views/earning_view.dart';
import 'package:drivers_app/Features/home/presentation/views/home_view.dart';
import 'package:drivers_app/Features/home/presentation/views/main_view.dart';
import 'package:drivers_app/Features/profile/presentation/views/profile_view.dart';
import 'package:drivers_app/Features/rating/presentation/views/rating_view.dart';
import 'package:drivers_app/Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const KSignIn = "/signin";
  static const KHomeView = '/home';
  static const KSignUp = '/signup';
  static const Kearning = '/earnings';
  static const Kprofile = '/profile';
  static const Krating = '/rating';
  static const Kcardetails = '/cardetails';
  static const Kmainview = '/mainview';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const MySplashView()),
    GoRoute(
      path: Kmainview,
      builder: (context, state) => const MainView(),
    ),
    GoRoute(path: KSignUp, builder: (context, state) => const SignUp()),
    GoRoute(path: KHomeView, builder: (context, state) => const HomeView()),
    GoRoute(path: Kearning, builder: (context, state) => const EarningView()),
    GoRoute(path: Kprofile, builder: (context, state) => const ProfileView()),
    GoRoute(path: Krating, builder: (context, state) => const RatingView()),
    GoRoute(path: Kcardetails, builder: (context, state) => const CarDetails()),
    GoRoute(path: KSignIn, builder: (context, state) => const SignIn())
  ]);
}
