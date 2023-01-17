import 'package:cs_100/app/features/resources/presentation/bindings/home_binding.dart';
import 'package:cs_100/routes/app_pages.dart';
import 'package:cs_100/shared/theme/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    DevicePreview(
      enabled: false,
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

    return GetMaterialApp(
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      title: 'CS 100',
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: AppRoutes.HOME,
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
    );
  }
}
