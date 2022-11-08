import 'package:get/get_state_manager/get_state_manager.dart';

class ProfileController extends GetxController {
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
  // google sign in

}

enum StudentYear { one, two, three, four }

enum Semester { one, two }
