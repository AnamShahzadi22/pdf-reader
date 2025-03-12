import 'package:go_router/go_router.dart';
import 'package:pdf_reader/home_screen.dart';
import 'package:pdf_reader/splash/onboarding.dart';

import '../splash/splash_screen.dart';


final class AppRoutes {
  AppRoutes._();

  static final instance = AppRoutes._();

  ///splash const
  static const String splashPage = "/";
  static const String onBoardPage = "/onboardpage";
  static const String homePage = "/homepage";




  GoRouter router = GoRouter(routes: [
    GoRoute(
      path: splashPage,
      name: NamedRoutes.splashPage.name,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: onBoardPage,
      name: NamedRoutes.onBoardPage.name,
      builder: (context, state) => OnBoardingPage(),
    ),
 GoRoute(
      path: homePage,
      name: NamedRoutes.homePage.name,
      builder: (context, state) => HomeScreen(),
    ),



  ]);
}

/// Enum for page names to avoid using plain strings
enum NamedRoutes {
  splashPage,
  onBoardPage,
  homePage,

}
