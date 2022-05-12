import 'package:flutter/material.dart';
import 'package:portfolio_flutter/screens/layout.dart';
import 'package:portfolio_flutter/screens/pages/home.dart';
import 'package:portfolio_flutter/screens/routes/parallax.dart';
import 'package:portfolio_flutter/screens/routes/slot_machine.dart';
import 'package:portfolio_flutter/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Parallax2.routeName: (context) => const Parallax2(),
        SlotMachine.routeName: (context) => const SlotMachine()
      },
      // showPerformanceOverlay: true,
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: darkThemeData,
      home: const Home(),
    );
  }
}
