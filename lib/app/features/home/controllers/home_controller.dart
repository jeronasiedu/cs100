import 'package:cs_100/app/features/courses/pages/courses_page.dart';
import 'package:cs_100/app/features/settings/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Widget> pages = [const CoursesPage(), const SettingsPage()];
  RxInt activePageIndex = 0.obs;
  Widget get activePage => pages[activePageIndex.value];
  void changePageIndex(int index) {
    activePageIndex.value = index;
  }
}
