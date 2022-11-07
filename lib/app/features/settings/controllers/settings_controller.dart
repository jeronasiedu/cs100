import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  GetStorage themeStore = GetStorage('theme');
  late final themeValue = themeStore.read('themeMode');
  late bool isDarkMode;

  // DARK MODE STUFFS

  void toggleDarkMode({required bool value}) {
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    isDarkMode = value;
    themeStore.write('themeMode', value);
    update();
  }

  @override
  void onInit() {
    getSavedTheme();
    super.onInit();
  }

  // get savedTheme value from storage or set it to Get.isDarkMode
  void getSavedTheme() {
    if (themeValue == null) {
      themeStore.write('themeMode', Get.isDarkMode);
      isDarkMode = Get.isDarkMode;
    } else {
      isDarkMode = themeValue;
    }
  }
}
