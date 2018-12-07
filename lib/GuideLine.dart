import 'package:flutter/material.dart';
import 'package:flutter_pdf_viewer/flutter_pdf_viewer.dart';
import 'dart:typed_data';

class GuideLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LoadFromAssetButton();
  }

}
class LoadFromAssetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        FlutterPdfViewer.loadAsset('assets/test.pdf');
      },
      child: Text('open from assets'),
    );
  }
}

class LoadUrlAsFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () async {
//        Scaffold.of(context).showSnackBar(
//          SnackBar(
//            content: Text('Downloading...'),
//            duration: Duration(days: 24),
//          ),
//        );

        String filePath = await FlutterPdfViewer.downloadAsFile(
          'http://apicloudservices.azurewebsites.net/files/pdf/7.pdf',
        );

        print("filePath: '$filePath'");

//        Scaffold.of(context).hideCurrentSnackBar();

        FlutterPdfViewer.loadFilePath(filePath);
      },
      child: Text('download + load as file (cached)'),
    );
  }
}

class LoadUrlAsBytes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () async {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Downloading...'),
            duration: Duration(days: 24),
          ),
        );

        Uint8List bytes = await FlutterPdfViewer.downloadAsBytes(
          'https://mozilla.github.io/pdf.js/web/compressed.tracemonkey-pldi-09.pdf',
        );

        Scaffold.of(context).hideCurrentSnackBar();

        FlutterPdfViewer.loadBytes(bytes);
      },
      child: Text('download + load as bytes (not cached)'),
    );
  }
}

class LoadHorizontalPdf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        FlutterPdfViewer.loadAsset('assets/test.pdf', swipeHorizontal: true);
      },
      child: Text('open horizontal pdf'),
    );
  }
}