import 'package:flutter/material.dart';

class PdfViewerScreen extends StatefulWidget {

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('PDF')),
        body: Placeholder());
  }
}
