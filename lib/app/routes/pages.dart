import 'package:cs_100/app/features/auth/bindings/auth_binding.dart';
import 'package:cs_100/app/features/auth/bindings/user_details_binding.dart';
import 'package:cs_100/app/features/auth/pages/auth_page.dart';
import 'package:cs_100/app/features/auth/pages/user_details_page.dart';
import 'package:cs_100/app/features/home/bindings/home_binding.dart';
import 'package:cs_100/app/features/home/pages/home_page.dart';
import 'package:get/get.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.auth,
      page: () => const AuthPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.userDetails,
      page: () => const UserDetailsPage(),
      binding: UserDetailsBinding(),
    ),
  ];
}
