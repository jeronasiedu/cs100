import 'package:cs_100/app/features/courses/controllers/domains_controller.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceController extends GetxController {
  final String name = Get.arguments['name'];
  final String description = Get.arguments['description'];
  final String url = Get.arguments['url'];
  final DomainsController _domainsController = Get.find();
  String get courseName => _domainsController.name;

  void openResource() async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      Get.snackbar("Error", "Sorry, link not working");
    }
  }

  void shareResource() {
    Share.share("Hey, checkout $name an awesome resource for $courseName");
  }
}
