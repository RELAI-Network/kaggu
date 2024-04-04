import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kaggu/core/extensions/navigator.dart';
import 'package:kaggu/features/readers/views/epub_viewer_view.dart';
import 'package:kaggu/features/readers/views/pdf_viewer_view.dart';

import '../models/local_book_model.dart';

class BooksGridView extends StatefulWidget {
  const BooksGridView({
    required this.books,
    super.key,
    this.onRefresh,
  });

  final List<LocalBookModel> books;

  final Future<void> Function()? onRefresh;

  @override
  State<BooksGridView> createState() => _BooksGridViewState();
}

class _BooksGridViewState extends State<BooksGridView> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: widget.books.isEmpty
          ? const Center(
              child: Text(
                '''No books opened since now. Books opened through your file explorer or Futur Store will appear here.''',
                textAlign: TextAlign.center,
              ),
            )
          : RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: () async {
                await widget.onRefresh?.call();
              },
              child: ListView(
                children: widget.books
                    .map(
                      (e) => Card(
                        child: ListTile(
                          onTap: () async {
                            if (e.type == BookType.epub) {
                              await context.pushTo(
                                EpubViewerView(
                                  epubFile: File(e.filePath),
                                ),
                              );
                            } else if (e.type == BookType.pdf) {
                              await context.pushTo(
                                PdfViewerView(pdfFile: File(e.filePath)),
                              );
                            }
                          },
                          leading: DecoratedBox(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: Colors.grey,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(e.type.name.toUpperCase()),
                            ),
                          ),
                          title: Text(e.title),
                          subtitle: Text(e.author ?? 'Unknown'),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
      // : GridView.count(
      //     crossAxisCount: 3,
      //     childAspectRatio: 0.5,
      //     children: books.map((a) {
      //       return Padding(
      //         padding: const EdgeInsets.all(8),
      //         child: BookCard(
      //           data: a,
      //         ),
      //       );
      //     }).toList(),
      //   ),
    );
  }
}
