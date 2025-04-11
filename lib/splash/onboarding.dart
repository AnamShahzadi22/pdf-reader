import 'package:flutter/material.dart';
import 'package:pdf_reader/splash/splashservice/splash_service.dart';

import '../style/style.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  @override
  void initState() {
    super.initState();
    SplashService().startTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: customGreyColor,
      body: Stack(
        children: [
          /// Background Image positioned below the logo
          Positioned(
            top: screenHeight * 0.1,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/background_splash.png',
              fit: BoxFit.fill,
            ),
          ),

          /// Column for content
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * 0.23,
                alignment: Alignment.center,
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/aiplaybooklogo.png',
                  height: screenHeight * 0.05,
                ),
              ),

              SizedBox(height: screenHeight * 0.4),

              /// Main Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Text(
                  "Let's Learn With Lots Of Fun!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.2,
                    fontSize: screenWidth * 0.1,
                    fontFamily: 'PoltawskiNowy',
                    fontWeight: FontWeight.bold,
                    color: whiteColor,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Sub Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Text(
                  "To The Next Generation Of Leaders, Artists, Developers, Teachers, Scientists, Innovators, Dreamers, And Their Parents.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: whiteColor,
                  ),
                ),
              ),
            ],
          ),

          // Get Started Button
          // Positioned(
          //   bottom: screenHeight * 0.05,
          //   left: screenWidth * 0.1,
          //   right: screenWidth * 0.1,
          //   child: TextButton(
          //
          //     onPressed: () {
          //       GoRouter.of(context).pushNamed(NamedRoutes.pdfHomePage.name);
          //     },
          //     child: Text(
          //       "Get Started",
          //       style: TextStyle(
          //         fontSize: screenWidth * 0.05,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
