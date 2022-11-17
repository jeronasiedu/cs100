import 'package:cs_100/app/routes/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  GetStorage themeStore = GetStorage('theme');
  GetStorage userStore = GetStorage('userStore');
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
      await userStore.erase();
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

  // chat us
  void chatUs() async {
    const number = "233544751048";
    const url =
        "https://wa.me/$number/?text=Hi developer, thanks for your work";
    final encodedUrl = Uri.encodeFull(url);
    final encodedUri = Uri.parse(encodedUrl);
    if (!await launchUrl(encodedUri, mode: LaunchMode.externalApplication)) {
      Get.snackbar("Error", "Whatsapp is not installed");
    }
  }

  void shareApp() {
    Share.share(
      "Hey, checkout CS100! A must have app for all computer science students ",
    );
  }
}
