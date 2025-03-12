import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:pdf_reader/home_screen.dart';
import 'package:pdf_reader/routes/app_routes.dart';
import 'package:pdf_reader/style/style.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final _noScreenShot = NoScreenshot.instance;
  await _noScreenShot.screenshotOff();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
        debugShowCheckedModeBanner: false,

        ///display page
        routerDelegate: AppRoutes.instance.router.routerDelegate,

        ///parse into meaningful format
        routeInformationParser: AppRoutes.instance.router.routeInformationParser,

        /// knows current route
        routeInformationProvider:
        AppRoutes.instance.router.routeInformationProvider,

      title: 'PDF Viewer',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle().copyWith(
                backgroundColor: const WidgetStatePropertyAll(btnColor),
                foregroundColor: const WidgetStatePropertyAll(blackColor),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                ),
                side: WidgetStatePropertyAll(
                  const BorderSide(color: Colors.transparent, width: 2),
                ),

                textStyle: const WidgetStatePropertyAll(
                  TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),

                ///for size on screen
                minimumSize: WidgetStatePropertyAll(
                    Size(MediaQuery.sizeOf(context).width, 55)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              // errorStyle: TextStyle(
              //   color: btnColor,
              //   fontSize: 13,
              // ),
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: purpleColor),
            useMaterial3: true,
            fontFamily: 'Poppins'
        ),
    // home: HomeScreen()

    );
  }
}

