import 'package:cs_100/app/features/auth/controllers/user_details_controller.dart';
import 'package:cs_100/shared/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class UserDetailsPage extends GetView<UserDetailsController> {
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Almost there!"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(14),
          children: [
            Row(
              children: [
                Text(
                  "Hi ",
                  style: Get.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "${controller.userName}",
                  style: Get.textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "!",
                  style: Get.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const Text(
              "Letting us know more about you helps us personalize your experience.",
            ),
            const SizedBox(height: 10),
            const Text("School"),
            RadioListTile(
              title: const Text("KNUST"),
              value: true,
              groupValue: true,
              onChanged: (value) {},
              // make this selected by default
            ),
            const RadioListTile(
              title: Text("LEGON"),
              value: false,
              subtitle: Text("Coming soon"),
              groupValue: null,
              onChanged: null,
            ),
            const RadioListTile(
              title: Text("UCC"),
              value: false,
              subtitle: Text("Coming soon"),
              groupValue: null,
              onChanged: null,
            ),
            const RadioListTile(
              title: Text("KTU"),
              value: true,
              subtitle: Text("Coming soon"),
              groupValue: null,
              onChanged: null,
            ),
            const SizedBox(height: 10),
            const Text(
              "Level",
            ),
            GetBuilder<UserDetailsController>(
              init: UserDetailsController(),
              initState: (_) {},
              builder: (_) {
                return RadioListTile(
                  title: const Text("First Year"),
                  value: StudentYear.one,
                  groupValue: controller.selectedYear,
                  onChanged: (value) {
                    controller.changeYear(value!);
                  },
                );
              },
            ),
            GetBuilder<UserDetailsController>(
              init: UserDetailsController(),
              initState: (_) {},
              builder: (_) {
                return RadioListTile(
                  title: const Text("Second Year"),
                  value: StudentYear.two,
                  groupValue: controller.selectedYear,
                  onChanged: (value) {
                    controller.changeYear(value!);
                  },
                );
              },
            ),
            GetBuilder<UserDetailsController>(
              init: UserDetailsController(),
              initState: (_) {},
              builder: (_) {
                return RadioListTile(
                  title: const Text("Third Year"),
                  value: StudentYear.three,
                  groupValue: controller.selectedYear,
                  onChanged: (value) {
                    controller.changeYear(value!);
                  },
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Semester"),
            GetBuilder<UserDetailsController>(
              init: UserDetailsController(),
              initState: (_) {},
              builder: (_) {
                return RadioListTile(
                  title: const Text("First Semester"),
                  value: Semester.one,
                  groupValue: controller.selectedSemester,
                  onChanged: (value) {
                    controller.changeSemester(value!);
                  },
                );
              },
            ),
            GetBuilder<UserDetailsController>(
              init: UserDetailsController(),
              initState: (_) {},
              builder: (_) {
                return RadioListTile(
                  title: const Text("Second Semester"),
                  value: Semester.two,
                  groupValue: controller.selectedSemester,
                  onChanged: (value) {
                    controller.changeSemester(value!);
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.saveDetails();
        },
        label: const Text("All Set!"),
        icon: const Icon(Ionicons.checkmark),
      ),
    );
  }
}
