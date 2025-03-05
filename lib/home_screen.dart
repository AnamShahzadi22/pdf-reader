import 'dart:io';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:pdf_reader/pdf_view_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart ' as path;
import 'package:secure_application/secure_application.dart';

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
    // TODO: implement initState
    super.initState();
    baseDirectory();
  }

  ///get permission and root directory toget all pdf from every folder in hte storage
  Future<void> baseDirectory() async {
    PermissionStatus permissionStatus =
        await Permission.manageExternalStorage.request();
    if (permissionStatus.isGranted) {
      var rootDirectory = await ExternalPath.getExternalStorageDirectories();
      await getFiles(rootDirectory!.first);
    }
  }

  ///get all pdf files from every folder

  Future<void> getFiles(String directoryPath) async {
    try {
      var rootDirectory = Directory(directoryPath);
      var directories = rootDirectory.list(recursive: false);

      await for (var element in directories) {
        if (element is File) {
          if (element.path.endsWith('.pdf')) {
            setState(() {
              _pdfFiles.add(element.path);
              _filteredFiles = _pdfFiles;
            });
          }
        } else {
          await getFiles(element.path);
        }
      }
    } catch (e) {
      // Handle the exception
    }
  }

  ///for searching
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
    return SecureApplication(
      
      child: SecureGate(
        blurr: 0, // Prevents screen recording
        opacity: 1,   // Full visibility when app is active
        lockedBuilder: (context, secure) => Center(child: CircularProgressIndicator()),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: _isSearching
                ? TextField(
                    decoration: InputDecoration(
                      hintText: "Search PDFs....",
                      border: InputBorder.none,
                    ), // InputDecoration
                    onChanged: (value) {
                      filterFiles(value);
                    },
                  ) // TextField
                : Text(
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
              ), // IconButton
            ], // Text
          ),
          body: _filteredFiles.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: _filteredFiles.length,
                  itemBuilder: (context, index) {
                    String filePath = _filteredFiles[index];
                    String fileName = path.basename(filePath);
                    return Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ), // RoundedRectangleBorder
                      child: ListTile(
                        title: Text(
                          fileName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ), // Text
                        leading: Icon(
                          Icons.picture_as_pdf,
                          color: Colors.redAccent,
                          size: 30,
                        ),
                        trailing: Icon(
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
              ///to refresh lisr of pdf...
              baseDirectory();
            },
            backgroundColor: Colors.white,
            child: Icon(Icons.refresh),
          ),
        ),
      ),
    );
  }
}
