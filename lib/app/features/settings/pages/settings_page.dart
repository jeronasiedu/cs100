import 'package:cs_100/app/features/settings/controllers/settings_controller.dart';
import 'package:cs_100/app/features/settings/pages/profile_page.dart';
import 'package:cs_100/shared/spinner.dart';
import 'package:cs_100/shared/utils/custom_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);
  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Center(
                child: CustomAvatar(
                  imageUrl: controller.userPhoto!,
                  radius: 70,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Get.to(() => ProfilePage());
              },
              title: const Text("Account"),
              trailing: const Icon(Ionicons.person_outline),
            ),
            const Divider(height: 0),
            GetBuilder<SettingsController>(
              init: SettingsController(),
              initState: (_) {},
              builder: (_) {
                return MergeSemantics(
                  child: ListTile(
                    title: const Text('DarkMode'),
                    onTap: () {
                      controller.toggleDarkMode(value: !controller.isDarkMode);
                    },
                    trailing: CupertinoSwitch(
                      trackColor:
                          Get.theme.colorScheme.tertiary.withOpacity(0.7),
                      activeColor: Get.theme.colorScheme.secondaryContainer,
                      value: controller.isDarkMode,
                      onChanged: (bool value) {
                        controller.toggleDarkMode(value: value);
                      },
                    ),
                  ),
                );
              },
            ),
            const Divider(height: 0),
            ListTile(
              onTap: () {
                controller.shareApp();
              },
              title: const Text("Share App"),
              trailing: const Icon(Icons.share),
            ),
            const Divider(height: 0),
            ListTile(
              onTap: () {},
              title: const Text("Rate App"),
              trailing: const Icon(Ionicons.heart_outline),
            ),
            const Divider(height: 0),
            ListTile(
              onTap: () {
                controller.chatUs();
              },
              title: const Text("Chat Us"),
              trailing: const Icon(Ionicons.logo_whatsapp),
            ),
            const Divider(height: 0),
            Obx(
              () => ListTile(
                onTap: () {
                  controller.logout();
                },
                title: const Text("Logout"),
                trailing: controller.isLoggingOut.value
                    ? Spinner(
                        color: Get.theme.colorScheme.error,
                      )
                    : const Icon(Icons.logout),
              ),
            ),
            const Divider(height: 0),
          ],
        ),
      ),
    );
  }
}
