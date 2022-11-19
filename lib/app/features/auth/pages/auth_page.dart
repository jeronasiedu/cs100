import 'package:cs_100/shared/spinner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../controllers/auth_controller.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/illustration.png',
                ),
                const SizedBox(height: 20),
                Text(
                  "Welcome to CS100",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 450,
                    ),
                    child: Text(
                      "Ready to commit to your computer science studies? Don't waste any more time looking for the best resources. There's only one place you need to go, CS100!",
                      style: Get.textTheme.bodyText2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ),
                  child: Obx(
                    () => ElevatedButton.icon(
                      onPressed: controller.isLoading.value
                          ? null
                          : () {
                              controller.signInWithGoogle();
                            },
                      icon: controller.isLoading.value
                          ? const Spinner()
                          : const Icon(
                              Ionicons.logo_google,
                            ),
                      label: const Text("Continue with Google"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
