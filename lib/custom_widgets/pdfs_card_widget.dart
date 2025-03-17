import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../style/style.dart';

class ChapterCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetImageUrl;
  final LinearGradient? borderGradient;
  final Function()? onTap;
  final Color? innerColor;

  const ChapterCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.assetImageUrl,
    this.borderGradient,
    required this.onTap,
    this.innerColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.1,
        decoration: BoxDecoration(
          border: GradientBoxBorder(gradient: linearGradientIndicator,width: 1.5),
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.2),
              blurRadius: 16.0,
              offset: const Offset(
                0.0,
                4.0,
              ),
            ),
          ],
          color: innerColor ?? ch1Color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Image.asset(
                assetImageUrl,
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                    ),
                  ),
                  SizedBox(height: screenHeight*0.007,),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: screenWidth * 0.033,
                      color: whiteColor,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
