import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

showErrorSnackbar({required String message}) {
  return Get
    ..closeAllSnackbars()
    ..snackbar(
      "Error",
      message,
      backgroundColor: Get.theme.colorScheme.errorContainer,
      colorText: Get.theme.colorScheme.onErrorContainer,
      icon: const Icon(Ionicons.warning_outline),
    );
}
