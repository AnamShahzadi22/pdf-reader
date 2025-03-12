// import 'package:flutter/material.dart';
// import '../style/style.dart';
//
// class CustomButton extends StatelessWidget {
//   const CustomButton({
//     super.key,
//     this.buttonColor = btnColor,
//     this.textColor = whiteColor,
//     this.title,
//     this.title2,
//     this.onPress,
//     this.height = 45,
//     this.width = 170,
//     this.loading = false,
//     this.borderRadius = 6.0,
//     this.topLeftRadius,
//     this.topRightRadius,
//     this.bottomLeftRadius,
//     this.bottomRightRadius,
//     this.borderColor = Colors.transparent,
//     this.padding = const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
//     this.fontWeight = FontWeight.w700,
//     this.fontSize = 16.0,
//     this.loadingIndicatorColor = whiteColor,
//     this.is3DShadow = false,
//     this.isInnerGlow = false,
//     this.isBevel = false,
//     this.customGradient,
//     this.fontFamily,
//     this.gradientBorder,
//     this.margin,
//     this.widthindicator,
//   });
//
//   final bool loading;
//   final bool is3DShadow;
//   final bool isInnerGlow;
//   final String? fontFamily;
//   final bool isBevel;
//   final String? title;
//   final Widget? title2;
//   final double height, width, borderRadius;
//   final double? widthindicator;
//   final double? topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius;
//   final VoidCallback? onPress;
//   final Color textColor, buttonColor, borderColor, loadingIndicatorColor;
//   final EdgeInsetsGeometry padding;
//   final EdgeInsetsGeometry? margin;
//   final FontWeight fontWeight;
//   final double fontSize;
//   final Gradient? customGradient;
//   final Gradient? gradientBorder;
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: loading ? null : onPress,
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         borderRadius: BorderRadius.circular(borderRadius),
//         child: Container(
//           height: height,
//           width: width,
//           margin: margin,
//           decoration: ShapeDecoration(
//             gradient: gradientBorder,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(topLeftRadius ?? borderRadius),
//                 topRight: Radius.circular(topRightRadius ?? borderRadius),
//                 bottomLeft: Radius.circular(bottomLeftRadius ?? borderRadius),
//                 bottomRight: Radius.circular(bottomRightRadius ?? borderRadius),
//               ),
//               side: BorderSide(color: borderColor),
//             ),
//           ),
//           child: DecoratedBox(
//             decoration: BoxDecoration(
//               color: buttonColor,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(topLeftRadius ?? borderRadius),
//                 topRight: Radius.circular(topRightRadius ?? borderRadius),
//                 bottomLeft: Radius.circular(bottomLeftRadius ?? borderRadius),
//                 bottomRight: Radius.circular(bottomRightRadius ?? borderRadius),
//               ),
//             ),
//             child: Padding(
//               padding: padding,
//               child: loading
//                   ? Center(
//                 child: SizedBox(
//                   width: widthindicator??25, // Set the desired width
//                   height: widthindicator??25, // Set the desired height
//                   child: CircularProgressIndicator(
//                     color: loadingIndicatorColor,
//                     strokeWidth: 3.0, // Optional: Adjust the thickness of the progress indicator
//                   ),
//                 ),
//               )
//                   : Center(
//                 child: title2 ??
//                     Text(
//                       title ?? '',
//                       style: TextStyle(
//                         fontFamily: fontFamily ?? 'Inter',
//                         color: textColor,
//                         fontWeight: fontWeight,
//                         fontSize: fontSize,
//                       ),
//                     ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
