// This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = FlexThemeData.light(
  scheme: FlexScheme.deepPurple,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  appBarStyle: FlexAppBarStyle.material,
  blendLevel: 9,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    inputDecoratorRadius: 40.0,
    appBarCenterTitle: true,
    inputDecoratorUnfocusedHasBorder: false,
    fabUseShape: true,
    chipRadius: 40.0,
    navigationBarLabelBehavior:
        NavigationDestinationLabelBehavior.onlyShowSelected,
    navigationBarSelectedLabelSize: 13,
    navigationBarUnselectedLabelSize: 13,
    // increase navigation bar height
    navigationBarHeight: 80,
    bottomSheetRadius: 20,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  fontFamily: GoogleFonts.mulishTextTheme().headline1!.fontFamily,
);
final darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.deepPurple,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 14,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    inputDecoratorRadius: 40.0,
    inputDecoratorUnfocusedHasBorder: false,
    fabUseShape: true,
    chipRadius: 40.0,
    navigationBarLabelBehavior:
        NavigationDestinationLabelBehavior.onlyShowSelected,
    appBarCenterTitle: true,
    navigationBarSelectedLabelSize: 13,
    navigationBarUnselectedLabelSize: 13,
    navigationBarHeight: 80,
    bottomSheetRadius: 20,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  fontFamily: GoogleFonts.mulishTextTheme().headline1!.fontFamily,
);

// INPUT DECORATION PADDING
const inputPadding = EdgeInsets.symmetric(
  vertical: 16,
  horizontal: 10,
);
