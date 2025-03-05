import 'package:flutter/material.dart';
import 'package:pdf_reader/home_screen.dart';

void main()async {
  //await  FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Viewer',
      theme: ThemeData(

        useMaterial3: true,
      ),
    home: HomeScreen()

    );
  }
}

