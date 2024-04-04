import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaggu/features/home/views/home_page.dart';
import 'package:kaggu/features/readers/views/epub_viewer_page.dart';
import 'package:kaggu/features/readers/views/pdf_viewer_page.dart';
import 'package:kaggu/features/splash/pages/splash_view.dart';

import '../providers/startup_provider.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startup = ref.watch(startUpProvider);

    if (startup.isLoading) {
      return const SplashView();
    }

    if (startup.hasValue && startup.value!.launchedFromFile) {
      if (startup.value!.isPdfFile) {
        return PdfViewerPage(startup.value!.fileToLaunch!);
      } else if (startup.value!.isEpubFile) {
        return EpubViewerPage(startup.value!.fileToLaunch!);
      }
    }

    return const HomePage();
  }
}
