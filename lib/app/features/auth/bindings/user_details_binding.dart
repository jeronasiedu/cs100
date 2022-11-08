import 'package:cs_100/app/features/auth/controllers/user_details_controller.dart';
import 'package:get/get.dart';

class UserDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserDetailsController>(() => UserDetailsController());
  }
}
