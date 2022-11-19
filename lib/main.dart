import 'package:cs_100/app/features/ads/ad_helper.dart';
import 'package:cs_100/app/features/auth/bindings/auth_binding.dart';
import 'package:cs_100/app/features/home/bindings/home_binding.dart';
import 'package:cs_100/app/routes/pages.dart';
import 'package:cs_100/app/theme/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AdHelper().initGoogleMobileAds();
  // FlutterNativeSplash.preserve(widgetsBinding: binding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  await GetStorage.init('theme');
  await GetStorage.init("userStore");
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
  // FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    GetStorage themeStore = GetStorage('theme');
    GetStorage userStore = GetStorage('userStore');
    final isDarkMode = themeStore.read('themeMode') ?? Get.isDarkMode;
    final isAuthenticated = userStore.read('id') != null;
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      title: 'CS 100',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      getPages: AppPages.pages,
      initialRoute: isAuthenticated ? AppRoutes.home : AppRoutes.auth,
      initialBinding: isAuthenticated ? HomeBinding() : AuthBinding(),
    );
  }
}
