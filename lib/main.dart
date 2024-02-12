import 'package:flutter/material.dart';
import 'package:kaggu/epub_viewer_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  @override
  Widget build(BuildContext context) =>  MaterialApp(
    title: 'KAGGU',
    debugShowCheckedModeBanner: false,
    home: EpubViewerScreen(),
  );
}
