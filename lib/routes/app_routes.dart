import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf_reader/about_us_page.dart';
import 'package:pdf_reader/home_screen.dart';
import 'package:pdf_reader/pdf_home.dart';
import 'package:pdf_reader/splash/onboarding.dart';

import '../pdf_view_screen.dart';
import '../splash/splash_screen.dart';


final class AppRoutes {
  AppRoutes._();

  static final instance = AppRoutes._();

  ///splash const
  // static const String splashPage = "/";
  static const String onBoardPage = "/";
  static const String homePage = "/homepage";
  static const String pdfHomePage = "/pdfHomePage";
  static const String pdfViewPage = "/pdfViewPage";
  static const String aboutUsPage = "/aboutUsPage";




  GoRouter router = GoRouter(routes: [
    // GoRoute(
    //   path: splashPage,
    //   name: NamedRoutes.splashPage.name,
    //   builder: (context, state) => const SplashScreen(),
    // ),
    GoRoute(
      path: onBoardPage,
      name: NamedRoutes.onBoardPage.name,
      builder: (context, state) => OnBoardingPage(),
    ),
    // GoRoute(
    //   path: homePage,
    //   name: NamedRoutes.homePage.name,
    //   builder: (context, state) => HomeScreen(),
    // ),
    GoRoute(
      path: pdfHomePage,
      name: NamedRoutes.pdfHomePage.name,
      builder: (context, state) => PdfHomePage(),
    ),
    GoRoute(
      path: aboutUsPage,
      name: NamedRoutes.aboutUsPage.name,
      builder: (context, state) => AboutUsPage(),
    ),
    GoRoute(
      path: AppRoutes.pdfViewPage,
      name: NamedRoutes.pdfViewPage.name,
      builder: (context, state) {
        final pdfPath = state.uri.queryParameters['pdfPath'] ?? '';
        return PdfViewScreen(pdfPath: pdfPath);
      },
    ),



  ]);
}

/// Enum for page names to avoid using plain strings
enum NamedRoutes {
  //splashPage,
  onBoardPage,
  homePage,
  pdfHomePage,
  pdfViewPage,
  aboutUsPage

}
