import 'package:flutter/material.dart';

import '../models/local_book_model.dart';
import 'books_grid_view.dart';

class BooksView extends StatefulWidget {
  const BooksView({required this.books, super.key});

  final List<LocalBookModel> books;

  @override
  State<BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {
  @override
  Widget build(BuildContext context) {
    return BooksGridView(books: widget.books);
  }
}
