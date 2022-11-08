import 'package:cs_100/app/routes/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  late GetStorage userDetailsBox;
  RxBool isLoading = false.obs;
  var isSignIn = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void onReady() {
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = _auth.currentUser != null;
    _auth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });
    FlutterNativeSplash.remove();
    super.onReady();
  }

  void handleAuthStateChanged(isLoggedIn) {
    if (isLoggedIn) {
      userDetailsBox = GetStorage(_auth.currentUser!.uid);
      final details = userDetailsBox.read('userDetails');
      if (details == null) {
        Get.offAllNamed(AppRoutes.userDetails);
      } else {
        Get.offAllNamed(
          AppRoutes.home,
        );
      }
    } else {
      Get.offAllNamed(AppRoutes.auth);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _auth.signInWithCredential(credential);
      }
    } on PlatformException {
      Get.snackbar(
        'Error',
        'An error occurred while signing in',
        backgroundColor: Get.theme.colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Get.theme.colorScheme.error,
      );
      return;
    } on FirebaseAuthException {
      Get.snackbar(
        'Error',
        'An error occurred while signing in, please try again',
        backgroundColor: Get.theme.colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Get.theme.colorScheme.error,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Authentication failed, please try again',
        backgroundColor: Get.theme.colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Get.theme.colorScheme.error,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
