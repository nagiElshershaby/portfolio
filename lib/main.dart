import 'package:flutter/material.dart';
import 'package:protofolio/ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nagi El-Shershaby',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff4F4F4F),
          secondary: const Color(0xffFFFFFF),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

