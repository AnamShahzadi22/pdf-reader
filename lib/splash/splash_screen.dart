// import 'package:flutter/material.dart';
// import 'package:pdf_reader/splash/splashservice/splash_service.dart';
//
// import '../style/style.dart';
//
// class SplashScreen extends StatefulWidget {
//
//   const SplashScreen({super.key});
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//     SplashService().startTimer(context);
//
//
// }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         /// Screen dimensions
//         final screenHeight = constraints.maxHeight;
//         final screenWidth = constraints.maxWidth;
//
//         /// Responsive sizes
//         final logoSize = screenWidth * 1;
//
//         return Scaffold(
//           body: Stack(
//             children: [
//               // Gradient background
//               Container(
//                 decoration: BoxDecoration(
//                   gradient: linearGradientSplash,
//                 ),
//               ),
//
//               /// Main content
//               Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     /// Logo
//                     Image.asset(
//                       'assets/images/intelli_logo.png',
//                       width: logoSize,
//                     ),
//                   ],
//                 ),
//               ),
//
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
