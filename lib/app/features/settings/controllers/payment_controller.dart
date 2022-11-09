import 'dart:io';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentController extends GetxController {
  final String authorizationUrl = Get.arguments;
  var loadingPercentage = 0.obs;

  @override
  void onInit() {
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
    super.onInit();
  }
}
