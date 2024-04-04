import 'package:flutter/material.dart';
import 'package:kaggu/core/theming/configs/app_spacing.dart';

import 'books_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
          ),
          child: BooksPage(),
        ),
      ),
    );
  }
}
