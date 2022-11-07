import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = FlexThemeData.light(
  scheme: FlexScheme.gold,
  useMaterial3: true,
  textTheme: GoogleFonts.poppinsTextTheme(
    Get.textTheme,
  ),
);

final darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.gold,
  useMaterial3: true,
  textTheme: GoogleFonts.poppinsTextTheme(
    ThemeData.dark().textTheme,
  ),
);
