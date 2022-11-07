import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class DomainsController extends GetxController {
  final String code = Get.arguments['code'];
  final String name = Get.arguments['name'];
  final String id = Get.arguments['id'];
}
