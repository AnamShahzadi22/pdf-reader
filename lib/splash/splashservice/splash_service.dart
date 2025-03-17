import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../routes/app_routes.dart';

class SplashService {
  /// Start the timer and navigate based on on boarding status
  void startTimer(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      if (context.mounted) {
        await navigateToPage(context);
      }
    });
  }

  /// Decide whether to show the on boarding page or directly navigate to the Free Tools page
  Future<void> navigateToPage(BuildContext context) async {
    context.goNamed(NamedRoutes.pdfHomePage.name);
  }
}
