import 'package:flutter/material.dart';
import 'package:portfolio_flutter/screens/pages/home.dart';
import 'package:portfolio_flutter/screens/routes/parallax.dart';
import 'package:portfolio_flutter/screens/routes/slot_machine.dart';
import 'package:portfolio_flutter/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context , orient , _ ) { 
        return MaterialApp(
        routes: {
          Parallax.routeName: (context) => const Parallax(),
          SlotMachine.routeName: (context) => const SlotMachine()
        },
        // showPerformanceOverlay: true,
        themeMode: ThemeMode.dark,
        title: 'Flutter Demo',
        theme: darkThemeData,
        home: const Home(),
      );
       },
     
    );
  }
}
