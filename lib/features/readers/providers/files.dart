import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<String?> moveFileFromCacheToDocuments(File file) async {
  try {
    final documentsPath = await getApplicationDocumentsDirectory();

    final filename = basename(file.path);

    final newPath = join(documentsPath.path, filename);

    await file.copy(newPath);

    return newPath;
  } catch (e) {
    debugPrint(e.toString());

    return null;
  }
}

Future<String?> writeBytesToFile(
  Uint32List bytes,
  String filenameWithExtension,
) async {
  try {
    final documentsPath = await getApplicationDocumentsDirectory();

    final newPath = join(documentsPath.path, filenameWithExtension);

    await File(newPath).writeAsBytes(bytes);

    return newPath;
  } catch (e) {
    debugPrint(e.toString());

    return null;
  }
}
