import 'package:cs_100/app/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.activePage),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.activePageIndex.value,
          onDestinationSelected: (value) {
            controller.changePageIndex(value);
          },
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 70,
          destinations: const [
            NavigationDestination(
              icon: Icon(Ionicons.grid_outline),
              label: 'Courses',
              selectedIcon: Icon(Ionicons.grid),
            ),
            NavigationDestination(
              icon: Icon(Ionicons.settings_outline),
              selectedIcon: Icon(Ionicons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
