import 'package:flutter/material.dart';
import 'package:portfolio_flutter/screens/home.dart';
import 'package:portfolio_flutter/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showPerformanceOverlay: true,
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: darkThemeData,
      home: const Home(),
    );
  }
}
