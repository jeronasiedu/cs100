import 'package:cs_100/app/features/settings/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({Key? key}) : super(key: key);
  final PaymentController controller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              onPageStarted: (url) {
                // change the loading percentage
                controller.loadingPercentage.value = 0;
              },
              onPageFinished: (url) {
                // change the loading percentage
                controller.loadingPercentage.value = 100;
              },
              onProgress: (progress) {
                // change the loading percentage
                controller.loadingPercentage.value = progress;
              },
              initialUrl: controller.authorizationUrl,
              javascriptMode: JavascriptMode.unrestricted,
              userAgent: "Flutter Webview",
              navigationDelegate: (navigation) {
                if (navigation.url == "https://standard.paystack.co/close") {
                  Navigator.of(context).pop();
                  Get.snackbar(
                    "Success",
                    "Payment successful",
                    backgroundColor: Colors.green,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return NavigationDecision.navigate;
                }

                return NavigationDecision.navigate;
              },
            ),
            Obx(
              () => controller.loadingPercentage.value == 100
                  ? const SizedBox.shrink()
                  : LinearProgressIndicator(
                      value: controller.loadingPercentage.value / 100,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
