import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaggu/core/widgets/loading_screen_view.dart';
import 'package:kaggu/features/home/models/local_book_model.dart';
import 'package:kaggu/features/home/providers/books_providers.dart';
import 'package:kaggu/features/readers/providers/document_file_info_provider.dart';
import 'package:path/path.dart';

import 'pdf_viewer_view.dart';

class PdfViewerPage extends ConsumerWidget {
  const PdfViewerPage(this.file, {super.key});

  final File file;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(booksProvider);

    if (books.initializing) {
      return const LoadingScreenView();
    } else {
      Future.delayed(
        Duration.zero,
        () async {
          final localBooks = books.value;

          if (localBooks.any(
            (book) =>
                book.filePath == file.path ||
                book.filenameWithExtension == basename(file.path),
          )) {
            return;
          }

          final bookInfo = await ref.read(
            documentFileInfoProvider(file, BookType.pdf).future,
          );

          if (bookInfo.title == null) return;

          books.setValueSilently(
            [
              LocalBookModel(
                filePath: bookInfo.newFilePath ?? file.path,
                filenameWithExtension: basename(file.path),
                author: bookInfo.author,
                title: bookInfo.title!,
                type: BookType.pdf,
                coverImagePath: bookInfo.coverImagePath,
              ),
              ...books.value,
            ],
          );
        },
      );
    }

    return PdfViewerView(pdfFile: file);
  }
}
