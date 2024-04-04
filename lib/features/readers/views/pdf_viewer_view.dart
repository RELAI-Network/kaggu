import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewerView extends StatefulWidget {
  const PdfViewerView({required this.pdfFile, super.key});

  final File pdfFile;

  @override
  State<PdfViewerView> createState() => _PdfViewerViewState();
}

class _PdfViewerViewState extends State<PdfViewerView> {
  late PdfControllerPinch _controller;

  @override
  void initState() {
    super.initState();
    _controller = PdfControllerPinch(
      // ignore: discarded_futures
      document: PdfDocument.openFile(widget.pdfFile.path),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF')),
      body: PdfViewPinch(
        controller: _controller,
      ),
    );
  }
}
