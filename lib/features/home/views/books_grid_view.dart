import 'package:flutter/material.dart';

import '../models/local_book_model.dart';
import '../widgets/book_card.dart';

class BooksGridView extends StatelessWidget {
  const BooksGridView({
    required this.books,
    super.key,
  });

  final List<LocalBookModel> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: books.isEmpty
          ? const Center(
              child: Text(
                '''No books opened since now. Books opened through your file explorer or Futur Store will appear here.''',
                textAlign: TextAlign.center,
              ),
            )
          : GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.5,
              children: books.map((a) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: BookCard(
                    data: a,
                  ),
                );
              }).toList(),
            ),
    );
  }
}
