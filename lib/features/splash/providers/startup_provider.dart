import 'dart:io';

import 'package:flutter/material.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'startup_provider.g.dart';

@riverpod
Future<
    ({
      bool launchedFromFile,
      File? fileToLaunch,
      bool isPdfFile,
      bool isEpubFile,
    })> startUp(
  StartUpRef ref,
) async {
  try {
    final fileLaunched = await ReceiveSharingIntent.getInitialMedia();

    if (fileLaunched.isNotEmpty) {
      final fileToOpen = fileLaunched.first;

      if (fileToOpen.path.endsWith('.pdf')) {
        return (
          launchedFromFile: true,
          fileToLaunch: File(fileToOpen.path),
          isPdfFile: true,
          isEpubFile: false,
        );
      } else if (fileToOpen.path.endsWith('.epub')) {
        return (
          launchedFromFile: true,
          fileToLaunch: File(fileToOpen.path),
          isPdfFile: false,
          isEpubFile: true,
        );
      }
    }

    return (
      launchedFromFile: false,
      fileToLaunch: null,
      isPdfFile: false,
      isEpubFile: false,
    );
  } catch (e) {
    debugPrint(e.toString());

    rethrow;
  }
}
