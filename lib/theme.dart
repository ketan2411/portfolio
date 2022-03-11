import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkThemeData = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme()
        .apply(bodyColor: Colors.white, displayColor: Colors.white)
    // .copyWith(
    //   subtitle2: TextStyle(
    //     color: textDarkColor.withOpacity(0.60),
    //   ),
    //   caption: TextStyle(
    //     color: textDarkColor.withOpacity(0.60),
    //   ),
    // );
    );
