import 'package:drivers_app/Features/Autentication/presentation/views/car_details.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/signin.dart';
import 'package:drivers_app/Features/earning/presentation/views/earning_view.dart';
import 'package:drivers_app/Features/home/presentation/views/home_view.dart';
import 'package:drivers_app/Features/profile/presentation/views/profile_view.dart';
import 'package:drivers_app/Features/rating/presentation/views/rating_view.dart';
import 'package:drivers_app/Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const KHomeView = '/home';
  static const KSignIN = '/signin';
  static const Kearning = '/earnings';
  static const Kprofile = '/profile';
  static const Krating = '/rating';
  static const Kcardetails = '/cardetails';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const MySplashView()),
    GoRoute(path: '/signin', builder: (context, state) => const SignIN()),
    GoRoute(path: '/home', builder: (context, state) => const HomeView()),
    GoRoute(
        path: '/earnings', builder: (context, state) => const EarningView()),
    GoRoute(path: '/profile', builder: (context, state) => const ProfileView()),
    GoRoute(path: '/rating', builder: (context, state) => const RatingView()),
    GoRoute(
        path: '/cardetails', builder: (context, state) => const CarDetails())
  ]);
}
