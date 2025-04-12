import 'package:flutter/material.dart';
import 'screens/news_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DJJB App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFBF4040)),
        useMaterial3: true,
      ),
      home: const NewsScreen(),
    );
  }
}
 

