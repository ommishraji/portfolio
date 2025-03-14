import 'package:flutter/material.dart';
import 'design/utils/app_theme.dart';
import 'features/home/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      title: 'Om Mishra',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
