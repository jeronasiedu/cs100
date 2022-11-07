import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  GetStorage themeStore = GetStorage('theme');
  late final themeValue = themeStore.read('themeMode');
  late bool isDarkMode = themeValue == Get.isDarkMode;

  // DARK MODE STUFFS

  void toggleDarkMode({required bool value}) {
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    themeStore.write('themeMode', value);
    isDarkMode = value;
    update();
  }
}
