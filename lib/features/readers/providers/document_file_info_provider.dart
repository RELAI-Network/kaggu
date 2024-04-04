import 'dart:io';

import 'package:dart_utils/dart_utils.dart';
import 'package:epubx/epubx.dart';
import 'package:flutter/foundation.dart';
import 'package:kaggu/features/home/models/local_book_model.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'files.dart';

part 'document_file_info_provider.g.dart';

@riverpod
Future<
    ({
      String? title,
      String? author,
      String? coverImagePath,
      String? newFilePath,
    })> documentFileInfo(
  DocumentFileInfoRef ref,
  File file,
  BookType type,
) async {
  try {
    if (type == BookType.epub) {
      final List<int> bytes = await file.readAsBytes();

      // Opens a book and reads all of its content into memory
      final book = await EpubReader.readBook(bytes);

      return (
        newFilePath: await moveFileFromCacheToDocuments(file),
        title: book.Title,
        author: book.Author,
        coverImagePath: (book.CoverImage == null || book.Title == null)
            ? null
            : await writeBytesToFile(
                book.CoverImage!.data,
                '${book.Title}.jpg',
              ),
      );
    } else if (type == BookType.pdf) {
      return (
        newFilePath: await moveFileFromCacheToDocuments(file),
        title: basenameWithoutExtension(file.path).capitalize,
        author: null,
        coverImagePath: null,
      );
    } else {
      return (
        newFilePath: null,
        title: null,
        author: null,
        coverImagePath: null,
      );
    }
  } catch (e) {
    debugPrint(e.toString());

    return (
      newFilePath: null,
      title: null,
      author: null,
      coverImagePath: null,
    );
    // rethrow;
  }
}
