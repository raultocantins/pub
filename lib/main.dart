import 'package:flutter/material.dart';
import 'package:pub/src/features/home/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff000000),
          background: const Color(0xff000000),
          primary: const Color(0xffEA1763),
          secondary: const Color(0xffFFFFFF),
          surface: const Color(0xff646464),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
