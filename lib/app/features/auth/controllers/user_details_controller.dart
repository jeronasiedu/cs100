import 'package:cs_100/shared/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserDetailsController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  late GetStorage userDetailsBox;
  String? get userName => auth.currentUser?.displayName;
  StudentYear selectedYear = StudentYear.one;
  Semester selectedSemester = Semester.one;
  void changeYear(StudentYear studentYear) {
    selectedYear = studentYear;
    update();
  }

  void changeSemester(Semester semester) {
    selectedSemester = semester;
    update();
  }

  @override
  void onInit() {
    userDetailsBox = GetStorage(auth.currentUser!.uid);
    super.onInit();
  }

  void saveDetails() {
    userDetailsBox.write(
      'userDetails',
      {
        'year': selectedYear.index,
        'semester': selectedSemester.index,
      },
    );
    Get.offAllNamed('/home');
  }
}
