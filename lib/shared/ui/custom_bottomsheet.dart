import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

showCustomBottomSheet(
    {double? height,
    String? title,
    required Widget child,
    bool isScrollControlled = false}) {
  return Get.bottomSheet(
    SizedBox(
      height: height ?? Get.height * 0.25,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Get.theme.hintColor.withOpacity(0.2),
                ),
              ),
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    ),
    backgroundColor: Get.theme.backgroundColor,
    isScrollControlled: isScrollControlled,
  );
}
