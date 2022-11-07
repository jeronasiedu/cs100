import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = FlexThemeData.light(
  scheme: FlexScheme.flutterDash,
  useMaterial3: true,
  textTheme: GoogleFonts.mulishTextTheme(
    Get.textTheme,
  ),
);

final darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.flutterDash,
  useMaterial3: true,
  textTheme: GoogleFonts.mulishTextTheme(
    ThemeData.dark().textTheme,
  ),
);
