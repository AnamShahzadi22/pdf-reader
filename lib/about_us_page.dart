import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pdf_reader/style/style.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
        decoration: const BoxDecoration(
          color: darkPurpleColor
          // gradient: LinearGradient(
          //   colors: [Color(0xFFD1C4E9), Color(0xFF9575CD)],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined, color: whiteColor),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
            body: ListView(
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.23),
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: whiteColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.06, vertical: screenHeight * 0.04),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Header Section
                            Text(
                              "About Us",
                              style: TextStyle(
                                fontFamily: 'PoltawskiNowy',
                                fontSize: screenWidth * 0.08,
                                fontWeight: FontWeight.bold,
                                color: darkPurpleColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              "Fun, easy AI learning for kids!",
                              style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.w500,
                                color: purpleColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: screenHeight * 0.02),

                            // Description Section
                            RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: screenWidth * 0.038,
                                  fontWeight: FontWeight.w400,
                                  color: darkPurpleColor,
                                  fontFamily: 'Poppins',
                                  height: 1.5,
                                ),
                                children: [
                                  const TextSpan(text: "AI Playbook is a project by "),
                                  TextSpan(
                                    text: "I Am Scientist",
                                    style: const TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final Uri url =
                                        Uri.parse('https://www.iamscientist.ai/');
                                        if (!await launchUrl(url,
                                            mode: LaunchMode.externalApplication)) {
                                          throw 'Could not launch $url';
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                  ),
                                  const TextSpan(
                                      text: " for Kids, designed to make AI fun and easy for young learners! Our experts tested over "),
                                  const TextSpan(
                                    text: "2,000",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const TextSpan(
                                      text: " tools to find the most exciting ones just for you. With step-by-step guides, fun quizzes, and hands-on AI missions, you’ll learn to create images, tell stories, and explore AI in a simple, engaging way. Whether you want to build apps, design projects, or solve real-world problems, this is your gateway to AI adventure!"),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.175,
            right: screenWidth * 0.1,
            child: Image.asset(
              "assets/images/ai.png",
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
