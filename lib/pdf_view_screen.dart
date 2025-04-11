import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:pdf_reader/style/style.dart';

class PdfViewScreen extends StatefulWidget {
  final String pdfPath;
  // final String pdfName;
  const PdfViewScreen({super.key, required this.pdfPath});

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  int totalPages =0;
  int currentPages =0;
  final NoScreenshot _noScreenShot = NoScreenshot.instance;

  @override
  void initState() {
    super.initState();
    _noScreenShot.screenshotOff();
  }

  @override
  void dispose() {
    _noScreenShot.screenshotOn(); // Re-enable screenshot when leaving the screen
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  whiteColor,
      appBar: AppBar(
        backgroundColor:  whiteColor,
        centerTitle: true,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('AI Playbook',
          style: TextStyle(
          color: darkPurpleColor,
          fontFamily: 'PoltawskiNowy',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: PDFView(
        filePath: widget.pdfPath,
        pageFling: false,
          autoSpacing: false,
        onRender: (pages){
          setState(() {
            totalPages = pages!;
          });
        },
        onPageChanged: (page,total){
          setState(() {
            currentPages = page!;
          });
        },
      ),
    );
  }
}
