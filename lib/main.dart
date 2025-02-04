import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: const Text('Nagi El-Shershaby'),
      ),
      body: PageView.builder(
        itemCount: 3,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            color: index.isEven ? Colors.black : Colors.black45,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Text('Page $index'),
            ),
          );
        },
      ),
    );
  }
}
