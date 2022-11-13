import 'package:cs_100/shared/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  late GetStorage userDetailsBox;
  StudentYear selectedYear = StudentYear.one;
  Semester selectedSemester = Semester.one;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? get userName => auth.currentUser?.displayName;
  String? get userEmail => auth.currentUser?.email;
  bool hasChangedDetails = false;
  void changeYear(StudentYear studentYear) {
    selectedYear = studentYear;
    hasChangedDetails = true;
    update();
  }

  void changeSemester(Semester semester) {
    selectedSemester = semester;
    hasChangedDetails = true;
    update();
  }

  void updateDetails() {
    userDetailsBox.write(
      'userDetails',
      {
        'year': selectedYear.index,
        'semester': selectedSemester.index,
      },
    );
    hasChangedDetails = false;
    Get.snackbar(
      "Update",
      "Your account info has been updated, navigate to course to see the new changes",
      backgroundColor: Get.theme.secondaryHeaderColor,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Get.theme.colorScheme.onTertiary,
    );
    update();
  }

  @override
  void onInit() {
    userDetailsBox = GetStorage(auth.currentUser!.uid);
    // get the user details from the box
    final details = userDetailsBox.read('userDetails');
    if (details != null) {
      selectedYear = StudentYear.values[details['year']];
      selectedSemester = Semester.values[details['semester']];
    }

    super.onInit();
  }
}
