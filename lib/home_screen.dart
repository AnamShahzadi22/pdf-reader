import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:pdf_reader/pdf_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _pdfFiles = [];
  List<String> _filteredFiles = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    copyBundledPdfs().then((_) {
      loadPDFFiles();
    });
  }

  /// Copies PDFs from assets to the app's storage if they don't already exist
  Future<void> copyBundledPdfs() async {
    List<Map<String, String>> bundledPdfs = [
      {'assetPath': 'assets/pdfs/1.pdf', 'fileName': '1.pdf'},
      {'assetPath': 'assets/pdfs/2.pdf', 'fileName': '2.pdf'},
      {'assetPath': 'assets/pdfs/3.pdf', 'fileName': '3.pdf'},
    ];

    Directory appDocDir = await getApplicationDocumentsDirectory();
    Directory pdfDirectory = Directory('${appDocDir.path}/pdfs');

    if (!await pdfDirectory.exists()) {
      await pdfDirectory.create();
    }

    for (var pdf in bundledPdfs) {
      File pdfFile = File('${pdfDirectory.path}/${pdf['fileName']}');
      if (!await pdfFile.exists()) {
        ByteData data = await rootBundle.load(pdf['assetPath']!);
        List<int> bytes = data.buffer.asUint8List();
        await pdfFile.writeAsBytes(bytes, flush: true);
      }
    }
  }

  /// Loads PDFs from the dedicated app folder
  Future<void> loadPDFFiles() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Directory pdfDirectory = Directory('${appDocDir.path}/pdfs');

    List<FileSystemEntity> files = pdfDirectory.listSync();
    setState(() {
      _pdfFiles = files
          .where((file) => file is File && file.path.endsWith('.pdf'))
          .map((file) => file.path)
          .toList();
      _filteredFiles = _pdfFiles;
    });
  }

  /// Filters PDF files based on search query
  void filterFiles(String query) {
    setState(() {
      _filteredFiles = _pdfFiles
          .where((file) =>
          file.split('/').last.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: _isSearching
            ? TextField(
          decoration: const InputDecoration(
            hintText: "Search PDFs....",
            border: InputBorder.none,
          ),
          onChanged: (value) {
            filterFiles(value);
          },
        )
            : const Text(
          "PDF Reader",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                _filteredFiles = _pdfFiles;
              });
            },
            icon: Icon(_isSearching ? Icons.cancel : Icons.search),
          ),
        ],
      ),
      body: _filteredFiles.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _filteredFiles.length,
        itemBuilder: (context, index) {
          String filePath = _filteredFiles[index];
          String fileName = path.basename(filePath);
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: Text(
                fileName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: const Icon(
                Icons.picture_as_pdf,
                color: Colors.redAccent,
                size: 30,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PdfViewScreen(
                          pdfName: fileName,
                          pdfPath: filePath,
                        )));
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          loadPDFFiles();
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
