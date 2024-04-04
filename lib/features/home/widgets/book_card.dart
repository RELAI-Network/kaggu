import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kaggu/core/extensions/navigator.dart';
import 'package:kaggu/core/extensions/theme_on_build_context.dart';
import 'package:kaggu/features/readers/views/epub_viewer_view.dart';
import 'package:kaggu/features/readers/views/pdf_viewer_view.dart';

import '../models/local_book_model.dart';

class BookCard extends StatelessWidget {
  const BookCard({required this.data, super.key, this.image});

  final LocalBookModel data;

  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (data.type == BookType.epub) {
          await context.pushTo(EpubViewerView(epubFile: File(data.filePath)));
        } else if (data.type == BookType.pdf) {
          await context.pushTo(PdfViewerView(pdfFile: File(data.filePath)));
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Material(
          //   elevation: 10,
          //   borderOnForeground: false,
          //   borderRadius: BorderRadius.circular(10),
          //   color: Colors.transparent,
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       borderRadius: BorderRadius.all(
          //         Radius.circular(10),
          //       ),
          //     ),
          //     width: 100,
          //     height: 170,
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(10),
          //       child: image == null
          //           ? data.coverImagePath == null
          //               ? Image.asset(
          //                   'assets/ebook.jpg',
          //                   fit: BoxFit.fill,
          //                 )
          //               : Image.file(
          //                   File(data.coverImagePath!),
          //                   fit: BoxFit.fill,
          //                   errorBuilder: (context, error, stackTrace) {
          //                     return Image.asset(
          //                       'assets/ebook.jpg',
          //                       fit: BoxFit.fill,
          //                     );
          //                   },
          //                 )
          //           : Image(
          //               image: image!,
          //               fit: BoxFit.fill,
          //             ),
          //     ),
          //   ),
          // ),
          if (data.author != null)
            Padding(
              padding: const EdgeInsets.all(1),
              child: Text(
                data.author!,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Text(
              data.title,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
