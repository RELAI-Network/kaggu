import 'package:flutter/material.dart';
import 'package:kaggu/core/extensions/build_context.dart';

class LoadingErrorScreenView extends StatelessWidget {
  const LoadingErrorScreenView({
    required this.retry,
    required this.error,
    super.key,
  });

  final String error;

  final VoidCallback retry;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error,
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: retry,
              // style: ElevatedButton.styleFrom(backgroundColor: context.),
              child: SizedBox(
                width: context.width * 0.5,
                child: const Text('Retry', textAlign: TextAlign.center),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
