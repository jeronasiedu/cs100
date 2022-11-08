import 'package:cs_100/app/routes/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsController extends GetxController {
  GetStorage themeStore = GetStorage('theme');
  late final themeValue = themeStore.read('themeMode');
  RxBool isLoggingOut = false.obs;
  late bool isDarkMode;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? get userPhoto => auth.currentUser?.photoURL;

  void logout() async {
    isLoggingOut.value = true;
    try {
      await GoogleSignIn().disconnect();
      await auth.signOut();
      Get.offAllNamed(AppRoutes.auth);
    } on PlatformException {
      Get.snackbar(
        'Error',
        'Something happened on our end. Try again later ',
        backgroundColor: Get.theme.colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Get.theme.colorScheme.error,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something happened on our end. Try again later ',
        backgroundColor: Get.theme.colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Get.theme.colorScheme.error,
      );
    } finally {
      isLoggingOut.value = false;
    }
  }

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
      isDarkMode = Get.isDarkMode;
    } else {
      isDarkMode = themeValue;
    }
  }
}
