import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_reader/custom_widgets/pdfs_card_widget.dart';
import 'package:pdf_reader/routes/app_routes.dart';
import 'package:pdf_reader/style/style.dart';

class PdfHomePage extends StatefulWidget {
  const PdfHomePage({super.key});

  @override
  State<PdfHomePage> createState() => _PdfHomePageState();
}

class _PdfHomePageState extends State<PdfHomePage> {
  List<String> _pdfFiles = [];

  @override
  void initState() {
    copyBundledPdfs().then((_) {
      loadPDFFiles();
    });
    super.initState();
  }

  Future<void> copyBundledPdfs() async {
    List<Map<String, String>> bundledPdfs = [
      {'assetPath': 'assets/pdfs/1.pdf', 'fileName': '1.pdf'},
      {'assetPath': 'assets/pdfs/2.pdf', 'fileName': '2.pdf'},
      {'assetPath': 'assets/pdfs/3.pdf', 'fileName': '3.pdf'},
      {'assetPath': 'assets/pdfs/4.pdf', 'fileName': '4.pdf'},
      {'assetPath': 'assets/pdfs/5.pdf', 'fileName': '5.pdf'},
    ];

    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      Directory pdfDirectory = Directory('${appDocDir.path}/pdfs');

      if (!await pdfDirectory.exists()) {
        await pdfDirectory.create(recursive: true);
      }

      for (var pdf in bundledPdfs) {
        File pdfFile = File('${pdfDirectory.path}/${pdf['fileName']}');
        if (!await pdfFile.exists()) {
          ByteData data = await rootBundle.load(pdf['assetPath']!);
          List<int> bytes = data.buffer.asUint8List();
          await pdfFile.writeAsBytes(bytes, flush: true);
        }
      }
      print("PDFs copied successfully!");
    } catch (e) {
      print("Error copying PDFs: $e");
    }
  }

  Future<void> loadPDFFiles() async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      Directory pdfDirectory = Directory('${appDocDir.path}/pdfs');

      if (await pdfDirectory.exists()) {
        List<FileSystemEntity> files = pdfDirectory.listSync();
        setState(() {
          _pdfFiles = files
              .whereType<File>()
              .where((file) => file.path.endsWith('.pdf'))
              .map((file) => file.path)
              .toList();
        });
        debugPrint("Loaded PDFs: $_pdfFiles");
      } else {
        debugPrint("PDF directory does not exist.");
      }
    } catch (e) {
      debugPrint("Error loading PDFs: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          /// Top Background Space
          Container(
            height: screenHeight * 1.3,
            width: screenWidth,
            color: darkPurpleColor,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.09),
            child: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Welcome to,\n",
                    style: TextStyle(
                      color: whiteColor,
                      fontFamily: 'PoltawskiNowy',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "AI Playbook",
                    style: TextStyle(
                      color: whiteColor,
                      fontFamily: 'PoltawskiNowy',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),

          /// Rounded Container with Robot
          Positioned(
            top: screenHeight * 0.22,
            left: 0,
            right: 0,
            child: Container(
              width: screenWidth,
              padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
              decoration: const BoxDecoration(
                color: customGreyColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(color: greyColor, blurRadius: 5),
                ],
              ),
              child: SizedBox(
                height: screenHeight,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                  children: [
                    const Text(
                      "Quick Introduction",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'PoltawskiNowy',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Chapter Cards
                    ChapterCard(
                      title: "Chapter # 01",
                      subtitle: "Make Cool Pictures And Videos With AI Magic",
                      assetImageUrl: 'assets/images/ch1.png',
                      onTap: () => _openPDF('1.pdf'),
                    ),
                    SizedBox(height: screenHeight * 0.013),
                    ChapterCard(
                      title: "Chapter # 02",
                      subtitle: "Simplify Your Writing",
                      assetImageUrl: 'assets/images/ch2.png',
                      innerColor: ch2Color,
                      onTap: () => _openPDF('2.pdf'),
                    ),
                    SizedBox(height: screenHeight * 0.013),
                    ChapterCard(
                      title: "Chapter # 03",
                      subtitle: "Become A Social Media Hero Using AI Tricks!",
                      assetImageUrl: 'assets/images/ch3.png',
                      innerColor: ch3Color,
                      onTap: () => _openPDF('3.pdf'),
                    ),
                    SizedBox(height: screenHeight * 0.013),
                    ChapterCard(
                      title: "Chapter # 04",
                      subtitle: "Time-Travel With AI: Be Super Productive!",
                      assetImageUrl: 'assets/images/ch4.png',
                      innerColor: ch4Color,
                      onTap: () => _openPDF('4.pdf'),
                    ),
                    SizedBox(height: screenHeight * 0.013),
                    ChapterCard(
                      title: "Chapter # 05",
                      subtitle: "Master The Most Used AI Tool: ChatGPT",
                      assetImageUrl: 'assets/images/ch5.png',
                      innerColor: ch5Color,
                      onTap: () => _openPDF('5.pdf'),
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // About Us Button
                    Center(
                      child: TextButton(
                        style: const ButtonStyle().copyWith(
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          ),
                          minimumSize: const WidgetStatePropertyAll(Size(220, 40)),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        onPressed: () {
                          GoRouter.of(context).pushNamed(NamedRoutes.aboutUsPage.name);
                        },
                        child: const Text(
                          "About Us",
                          style: TextStyle(color: blackColor, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Robot Image Positioned
          Positioned(
            top: screenHeight * 0.08,
            right: screenWidth * 0.05,
            child: Image.asset(
              "assets/images/robot.png",
              height: 150,
            ),
          ),
        ],
      ),
    );
  }

  void _openPDF(String fileName) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.path}/pdfs/$fileName';

    GoRouter.of(context).pushNamed(NamedRoutes.pdfViewPage.name,queryParameters: {'pdfPath':filePath});
  }
}
