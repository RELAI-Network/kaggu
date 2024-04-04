import 'dart:io';

import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';

class EpubViewerView extends StatefulWidget {
  const EpubViewerView({required this.epubFile, super.key});

  final File epubFile;

  @override
  State<EpubViewerView> createState() => _EpubViewerViewState();
}

class _EpubViewerViewState extends State<EpubViewerView> {
  late EpubController _epubController;

  @override
  void initState() {
    _epubController = EpubController(
      // ignore: discarded_futures
      document: EpubDocument.openFile(widget.epubFile),
    );
    super.initState();
  }

  @override
  void dispose() {
    _epubController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: EpubViewActualChapter(
          controller: _epubController,
          builder: (chapterValue) => Text(
            chapterValue?.chapter?.Title?.replaceAll('\n', '').trim() ?? '',
            textAlign: TextAlign.start,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save_alt),
            color: Colors.white,
            onPressed: () => _showCurrentEpubCfi(context),
          ),
        ],
      ),
      drawer: Drawer(
        child: EpubViewTableOfContents(controller: _epubController),
      ),
      body: EpubView(
        builders: EpubViewBuilders<DefaultBuilderOptions>(
          options: const DefaultBuilderOptions(),
          chapterDividerBuilder: (_) => const Divider(),
        ),
        controller: _epubController,
      ),
    );
  }

  void _showCurrentEpubCfi(BuildContext context) {
    final cfi = _epubController.generateEpubCfi();

    if (cfi != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(cfi),
          action: SnackBarAction(
            label: 'GO',
            onPressed: () {
              _epubController.gotoEpubCfi(cfi);
            },
          ),
        ),
      );
    }
  }
}
