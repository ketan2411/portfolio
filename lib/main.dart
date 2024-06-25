import 'package:flutter/material.dart';
import 'package:portfolio_flutter/provider/quiz_provider.dart';
import 'package:portfolio_flutter/screens/pages/home.dart';
import 'package:portfolio_flutter/screens/routes/projects.dart';
import 'package:portfolio_flutter/screens/routes/showcase.dart';
import 'package:portfolio_flutter/screens/routes/leaderboard/leaderboard_screen.dart';
import 'package:portfolio_flutter/screens/routes/parallax.dart';
import 'package:portfolio_flutter/screens/routes/quiz/quiz_play_screen.dart';
import 'package:portfolio_flutter/screens/routes/slot_machine.dart';
import 'package:portfolio_flutter/theme.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orient, _) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<QuizProvider>(create: (_) => QuizProvider()),
          ],
          child: MaterialApp(
            routes: {
              Parallax.routeName: (context) => const Parallax(),
              Projects.routeName: (context) => const Projects(),
              Showcase.routeName: (context) => const Showcase(),
              SlotMachine.routeName: (context) => const SlotMachine(),
              QuizPlayScreen.routeName: (context) => const QuizPlayScreen(),
              LeaderBoardScreen.routeName: (context) =>
                  const LeaderBoardScreen(),
            },
            // showPerformanceOverlay: true,
            themeMode: ThemeMode.dark,
            title: 'Flutter Demo',
            theme: darkThemeData,
            home: const Home(),
          ),
        );
      },
    );
  }
}
