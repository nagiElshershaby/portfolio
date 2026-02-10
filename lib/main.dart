import 'package:portfolio/providers/theme_provider.dart';
// import 'package:portfolio/ui/draft.dart';
import 'package:portfolio/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:portfolio/ui/pages/projects_page.dart';
import 'package:provider/provider.dart';
// import 'package:protofolio/ui/pages/projects_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: themeProvider.themeMode,
      home: const HomePage(),
      // home: ProjectsPage(),
      // home: const Draft(),
    );
  }
}

