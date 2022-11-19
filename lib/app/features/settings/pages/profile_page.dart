import 'package:cs_100/app/features/settings/controllers/profile_controller.dart';
import 'package:cs_100/shared/enums.dart';
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
        title: Text(controller.userName!),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(14),
          children: [
            const Text("Email"),
            Text(
              controller.userEmail!,
              style: Get.textTheme.bodyLarge,
            ),
            const Divider(),
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
            const Text("Level"),
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
            GetBuilder<ProfileController>(
              init: ProfileController(),
              initState: (_) {},
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: ElevatedButton.icon(
                    onPressed: controller.hasChangedDetails
                        ? () {
                            controller.updateDetails();
                          }
                        : null,
                    icon: const Icon(Ionicons.checkmark),
                    label: const Text("Update"),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
