import 'package:flutter/material.dart';

class LoadingScreenView extends StatelessWidget {
  const LoadingScreenView({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          const SizedBox(height: 20),
          Text(message ?? 'Chargement...'),
        ],
      ),
    );
  }
}
