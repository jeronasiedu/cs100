import 'package:cs_100/app/features/resources/presentation/bindings/home_binding.dart';
import 'package:cs_100/app/features/resources/presentation/pages/home_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    )
  ];
}
