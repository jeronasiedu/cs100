import 'package:cs_100/app/features/settings/pages/payment_page.dart';
import 'package:cs_100/app/routes/pages.dart';
import 'package:dio/dio.dart';
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

  // text editing controllers
  // always display GHc when editing
  TextEditingController amountController = TextEditingController();

  // void init payment process
  void initPayment() async {
    try {
      final response = await Dio().post(
        'https://api.paystack.co/transaction/initialize',
        data: {
          // add more zeros to amount
          'email': auth.currentUser?.email,
          'amount': int.parse(amountController.text) * 100,
        },
        // add headers
        options: Options(
          headers: {
            'Authorization':
                'Bearer sk_test_2df3a274f7ddc2a070e4a030f79f6466e9127c52',
            'Content-Type': 'application/json',
          },
        ),
      );
      // get the authorization url
      final authorizationUrl = response.data['data']['authorization_url'];
      // open the authorization url in a webview
      Get.to(() => PaymentPage(), arguments: authorizationUrl);
    } catch (e) {
      print(e);
      Get.snackbar(
        "Error",
        "An error occurred while processing payment",
        backgroundColor: Get.theme.colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

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

  // support me
  void supportMe() {
    Get.defaultDialog(
      title: 'Support Me',
      titleStyle: Get.textTheme.headline6,
      content: Column(
        children: [
          const Text(
            'If you like this app, please consider supporting me by buying me a coffee.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          // input field for amount
          TextFormField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: amountController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixText: "Ghc ",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: 'Amount',
              isDense: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 8.0,
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter an amount';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          const Text(
            'Thank you for your support!',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
      textConfirm: 'Support Me',
      onConfirm: () {
        // check if amount is empty
        // if empty, show snackbar
        if (amountController.text.isEmpty) {
          Get.snackbar(
            'Error',
            'Please enter an amount',
            backgroundColor: Get.theme.colorScheme.errorContainer,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Get.theme.colorScheme.error,
          );
          return;
        }

        Get.back();
        initPayment();
      },
    );
  }
}
