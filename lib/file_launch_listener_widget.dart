import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kaggu/core/extensions/navigator.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import 'features/readers/views/epub_viewer_page.dart';
import 'features/readers/views/pdf_viewer_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class FileLaunchListenerWidget extends StatefulWidget {
  const FileLaunchListenerWidget({required this.child, super.key});

  final Widget child;

  @override
  State<FileLaunchListenerWidget> createState() =>
      _FileLaunchListenerWidgetState();
}

class _FileLaunchListenerWidgetState extends State<FileLaunchListenerWidget> {
  late StreamSubscription<List<SharedMediaFile>> _intentSub;

  @override
  void dispose() {
    // ignore: discarded_futures
    _intentSub.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Listen to media sharing coming from outside the app while
    // the app is in the memory.
    _intentSub = ReceiveSharingIntent.getMediaStream().listen(
      (value) {
        setState(() {
          if (value.isNotEmpty) {
            final fileToOpen = value.first;

            if (fileToOpen.path.endsWith('.pdf')) {
              unawaited(
                globalContext.pushTo(PdfViewerPage(File(fileToOpen.path))),
              );
            } else if (fileToOpen.path.endsWith('.epub')) {
              unawaited(
                globalContext.pushTo(EpubViewerPage(File(fileToOpen.path))),
              );
            }
          }
        });
      },
      // ignore: inference_failure_on_untyped_parameter
      onError: (err) {
        debugPrint('getIntentDataStream error: $err');
      },
    );
  }

  BuildContext get globalContext => navigatorKey.currentContext!;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
