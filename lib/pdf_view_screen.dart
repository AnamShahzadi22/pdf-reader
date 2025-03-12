import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:no_screenshot/no_screenshot.dart';

class PdfViewScreen extends StatefulWidget {
  final String pdfPath;
  final String pdfName;
  const PdfViewScreen({super.key, required this.pdfPath, required this.pdfName});

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
    _noScreenShot.screenshotOff(); // Disable screenshot when PDF is opened
  }

  @override
  void dispose() {
    _noScreenShot.screenshotOn(); // Re-enable screenshot when leaving the screen
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.pdfName),
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
