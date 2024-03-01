import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:piatoopronto/Expo/exports.dart';

import '../../../constants/constants.dart';
import '../../widgets/coustom_app_widget.dart';

class privacypolicy extends StatefulWidget {
  const privacypolicy({super.key});

  @override
  State<privacypolicy> createState() => _privacypolicyState();
}

class _privacypolicyState extends State<privacypolicy> {
  @override
  void initState() {
    // TODO: implement initState
    getFileFromAsset("assets/images/About.pdf").then((f) {
      setState(() {
        asset = f.path;
        print(asset);
      });
    });
    super.initState();
  }

  String asset = '';
  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/Mypdf.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: PDFView(
        fitEachPage: true,
        filePath: asset,
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: false,
        pageFling: false,
        onRender: (_pages) {
          print('Rendered $_pages pages!');
        },
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('Error while loading page $page: $error');
        },
        onViewCreated: (PDFViewController pdfViewController) {
          // You can use the controller for various actions like controlling the PDF
          // Eg. pdfViewController.setPage(0);
        },
        onPageChanged: (page, total) {
          print('page change: $page/$total');
        },
      ),
    );
  }
}
