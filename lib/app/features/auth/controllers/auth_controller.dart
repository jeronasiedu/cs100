import 'package:get/get.dart';

class AuthController extends GetxController {
  StudentYear selectedYear = StudentYear.one;
  void changeYear(StudentYear studentYear) {
    selectedYear = studentYear;
    update();
  }
  // google sign in

}

enum StudentYear { one, two, three, four }
