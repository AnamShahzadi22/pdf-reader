import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf_reader/routes/app_routes.dart';
import 'package:pdf_reader/style/style.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Purple Background Shape
          Positioned(
            top: screenHeight * 0.2,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.6,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
          ),

          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.08),

              // Logo
              Center(
                child: Image.asset(
                    'assets/images/intelli_logo.png'
                ),
              ),

              SizedBox(height: screenHeight * 0.1),

              // Face Image (Mocked with a Container, Replace with an actual image)
              Center(
                child: Container(
                  width: screenWidth * 0.6,
                  height: screenWidth * 0.6,
                  decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Image.asset(
                      'assets/images/background_splash.png'
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              // Main Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Text(
                  "Let's Learn With Lots Of Fun!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),

          // Get Started Button
          Positioned(
            bottom: screenHeight * 0.05,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: TextButton(onPressed: (){
              GoRouter.of(context).pushNamed(NamedRoutes.homePage.name);
            }, child: Text(
              "Get Started",
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),),
          ),
        ],
      ),
    );
  }
}
