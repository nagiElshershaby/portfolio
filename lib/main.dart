import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'business_logic/home_viewmodel.dart';
import 'business_logic/project_viewmodel.dart';
import 'business_logic/theme_viewmodel.dart';
import 'core/themes/app_theme.dart';
import 'data/datasources/project_local_datasource.dart';
import 'data/repositories/project_repository.dart';
import 'ui/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
        ChangeNotifierProvider(
          create: (_) => ProjectViewModel(
            repository: ProjectRepositoryImpl(
              datasource: const ProjectLocalDatasource(),
            ),
          ),
        ),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeVM = context.watch<ThemeViewModel>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nagi El-Shershaby',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeVM.themeMode,
      home: const HomeScreen(),
    );
  }
}
