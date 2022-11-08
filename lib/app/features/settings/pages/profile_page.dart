import 'package:cs_100/app/features/settings/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jeron Asiedu"),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(14),
          children: [
            const Text("Email"),
            Text(
              "norejudeisa@gmail.com",
              style: Get.textTheme.bodyLarge,
            ),
            const Divider(),
            const SizedBox(height: 10),
            const Text("Student Year"),
            GetBuilder<ProfileController>(
              init: ProfileController(),
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
            GetBuilder<ProfileController>(
              init: ProfileController(),
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
            GetBuilder<ProfileController>(
              init: ProfileController(),
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
            GetBuilder<ProfileController>(
              init: ProfileController(),
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
            GetBuilder<ProfileController>(
              init: ProfileController(),
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
            const SizedBox(height: 25),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Ionicons.checkmark),
                label: const Text("Update"))
          ],
        ),
      ),
    );
  }
}
