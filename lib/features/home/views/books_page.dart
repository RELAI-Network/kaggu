import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaggu/core/widgets/loading_screen_view.dart';

import '../providers/books_providers.dart';
import 'books_view.dart';

class BooksPage extends ConsumerWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(booksProvider);

    if (books.initializing) {
      return const LoadingScreenView();
    }

    return BooksView(
      books: books.value,
      onRefresh: () async {
        // ignore: unused_result
        ref.refresh(booksProvider);
      },
    );
  }
}
