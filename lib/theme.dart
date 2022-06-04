import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    appBarTheme: AppBarTheme(backgroundColor: darkBackground),
    dividerTheme: const DividerThemeData(
        endIndent: defaultPadding * 4,
        thickness: 2,
        space: defaultPadding,
        indent: defaultPadding * 4),
    textTheme: GoogleFonts.poppinsTextTheme()
        .copyWith(headline5: const TextStyle(letterSpacing: defaultPadding))
        .apply(bodyColor: lightPrimary, displayColor: lightPrimary));
