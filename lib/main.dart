import 'package:cs_100/app/features/auth/bindings/auth_binding.dart';
import 'package:cs_100/app/routes/pages.dart';
import 'package:cs_100/app/theme/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  await GetStorage.init('theme');
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
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
    final isDarkMode = themeStore.read('themeMode') ?? Get.isDarkMode;
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
      initialRoute: AppRoutes.auth,
      initialBinding: AuthBinding(),
    );
  }
}
