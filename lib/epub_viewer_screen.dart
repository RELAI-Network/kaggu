import 'dart:async';
import 'dart:io';

import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class EpubViewerScreen extends StatefulWidget {
  const EpubViewerScreen({Key? key}) : super(key: key);

  @override
  State<EpubViewerScreen> createState() => _EpubViewerScreenState();
}

class _EpubViewerScreenState extends State<EpubViewerScreen> {
  late EpubController _epubController;

  late StreamSubscription _intentSub;
  final _sharedFiles = <SharedMediaFile>[];

  @override
  void initState() {
    _epubController = EpubController(
      document: EpubDocument.openAsset('assets/fables-jlf.epub'),
    );
    super.initState();

    // Listen to media sharing coming from outside the app while the app is in the memory.
    _intentSub = ReceiveSharingIntent.getMediaStream().listen(
      (value) {
        setState(() {
          _sharedFiles.clear();
          _sharedFiles.addAll(value);

          print(_sharedFiles.map((f) => f.toMap()));

          if (value.isNotEmpty) {
            _epubController.loadDocument(
              EpubDocument.openFile(
                File(value.first.path),
              ),
            );
          }
        });
      },
      onError: (err) {
        print("getIntentDataStream error: $err");
      },
    );

    // Get the media sharing coming from outside the app while the app is closed.
    ReceiveSharingIntent.getInitialMedia().then((value) {
      setState(() {
        _sharedFiles.clear();
        _sharedFiles.addAll(value);
        print(_sharedFiles.map((f) => f.toMap()));

        if (value.isNotEmpty) {
          _epubController.loadDocument(
            EpubDocument.openFile(
              File(value.first.path),
            ),
          );
        }

        // Tell the library that we are done processing the intent.
        ReceiveSharingIntent.reset();
      });
    });
  }

  @override
  void dispose() {
    _epubController.dispose();
    _intentSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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

  void _showCurrentEpubCfi(context) {
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
