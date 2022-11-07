import 'dart:ui';

import 'package:cs_100/app/features/settings/controllers/settings_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);
  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: Get.height * 0.3,
          flexibleSpace: FlexibleSpaceBar(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Norej Udeisa",
                    style: GoogleFonts.quicksand(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                Text(
                  "norejudeisa@gmail.com",
                  style: GoogleFonts.quicksand(
                    fontSize: 10,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
            background: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: const SizedBox(),
              ),
            ),
          ),
          stretch: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const ListTile(
                title: Text("Profile"),
                trailing: Icon(Ionicons.chevron_forward),
              ),
              GetBuilder<SettingsController>(
                init: SettingsController(),
                initState: (_) {},
                builder: (_) {
                  return MergeSemantics(
                    child: ListTile(
                      title: const Text('DarkMode'),
                      onTap: () {
                        controller.toggleDarkMode(
                            value: !controller.isDarkMode);
                      },
                      trailing: CupertinoSwitch(
                        trackColor:
                            Get.theme.colorScheme.tertiary.withOpacity(0.7),
                        activeColor: Get.theme.colorScheme.primary,
                        value: controller.isDarkMode,
                        onChanged: (bool value) {
                          controller.toggleDarkMode(value: value);
                        },
                      ),
                    ),
                  );
                },
              ),
              const ListTile(
                title: Text("Share App"),
                trailing: Icon(Icons.share),
              ),
              const ListTile(
                title: Text("Support Us"),
                trailing: Icon(Ionicons.heart_outline),
              ),
              const ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.logout),
              ),
            ],
          ),
        )
      ],
    );
  }
}
