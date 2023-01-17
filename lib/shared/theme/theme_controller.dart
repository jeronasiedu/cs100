import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';

class ThemeController extends GetxController {
  GetStorage themeStore = GetStorage('theme');
  late final isDarkMode = themeStore.read('isDarkMode');

  final List<Widget> themeIcons = <Widget>[
    const Icon(Ionicons.sunny_outline),
    const Icon(Ionicons.phone_portrait_outline),
    const Icon(Ionicons.moon_outline)
  ];
  final List<bool> selectedThemeIcon = <bool>[false, true, false];

  void enableLightMode() {
    Get.changeThemeMode(ThemeMode.light);
    themeStore.write('isDarkMode', false);
    selectedThemeIcon[0] = true;
    selectedThemeIcon[1] = false;
    selectedThemeIcon[2] = false;
    update();
  }

  void enableSystemThemeMode() {
    Get.changeThemeMode(ThemeMode.system);
    themeStore.erase();
    selectedThemeIcon[0] = false;
    selectedThemeIcon[1] = true;
    selectedThemeIcon[2] = false;
    update();
  }

  void enableDarkMode() {
    Get.changeThemeMode(ThemeMode.dark);
    themeStore.write('isDarkMode', true);
    selectedThemeIcon[0] = false;
    selectedThemeIcon[1] = false;
    selectedThemeIcon[2] = true;
    update();
  }

  @override
  void onInit() {
    getSavedTheme();
    super.onInit();
  }

  // get savedTheme value from storage or set it to Get.isDarkMode
  void getSavedTheme() {
    if (isDarkMode == null) {
      selectedThemeIcon[0] = false;
      selectedThemeIcon[1] = true;
      selectedThemeIcon[2] = false;
    } else {
      selectedThemeIcon[0] = isDarkMode == false;
      selectedThemeIcon[1] = false;
      selectedThemeIcon[2] = isDarkMode == true;
    }
  }
}
