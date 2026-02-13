import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    const seedColor = Color(0xff4F4F4F);

    // ----- LIGHT COLOR SCHEME -----
    final lightColorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
    );

    // ----- DARK COLOR SCHEME -----
    final darkColorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
    );

    // ----- GLOBAL TEXT THEME (Raleway) -----
    final textTheme = GoogleFonts.ralewayTextTheme(
      ThemeData.light().textTheme, // base text theme
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nagi El-Shershaby',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: textTheme,
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: lightColorScheme.outline.withValues(alpha: .2),
              width: 1,
            ),
          ),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: lightColorScheme.primaryContainer,
          labelStyle: GoogleFonts.raleway(
            color: lightColorScheme.onPrimaryContainer,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: GoogleFonts.ralewayTextTheme(
          ThemeData.dark().textTheme,
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: darkColorScheme.outline.withValues(alpha: .2),
              width: 1,
            ),
          ),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: darkColorScheme.primaryContainer,
          labelStyle: GoogleFonts.raleway(
            color: darkColorScheme.onPrimaryContainer,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      themeMode: themeProvider.themeMode,
      home: const HomePage(),
    );
  }
}