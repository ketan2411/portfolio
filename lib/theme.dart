import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants.dart';

Color scaffoldBackground = const Color.fromARGB(255, 245, 245, 245);
Color lightPrimary = Colors.grey[900] ?? Colors.grey;
Color darkPrimary = Colors.white;
Color darkBackground = Colors.grey[900] ?? Colors.grey;
Color lightBackground = Colors.white;
Color colorAmber = Colors.amberAccent;
Color colorBlue = const Color(0xff0063B2);
Color colorMossGreen = const Color(0xff97BC62);

ThemeData darkThemeData = ThemeData(
  primaryColor: colorMossGreen,
  appBarTheme:const AppBarTheme(backgroundColor: Colors.transparent),
  dividerTheme: const DividerThemeData(
      endIndent: defaultPadding * 4,
      thickness: 2,
      space: defaultPadding,
      indent: defaultPadding * 4),
);