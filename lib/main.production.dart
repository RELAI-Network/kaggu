import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/splash/pages/splash_page.dart';
import 'file_launch_listener_widget.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return FileLaunchListenerWidget(
      child: MaterialApp(
        title: 'KAGGU',
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
        navigatorKey: navigatorKey,
      ),
    );
  }
}
