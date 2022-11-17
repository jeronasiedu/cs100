import 'package:cs_100/app/features/courses/models/course_model.dart';
import 'package:cs_100/shared/app_status.dart';
import 'package:cs_100/shared/database.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CoursesController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late GetStorage userDetailsBox;
  late String year;
  late int semester;
  Rx<BannerAd>? bannerAd;
  RxBool isUserDetailsReady = false.obs;
  final courses = Rx<Either<AppStatus, List<CourseModel>>>(
    const Right(<CourseModel>[]),
  );
  @override
  void onInit() async {
    await GetStorage.init(_auth.currentUser!.uid);
    userDetailsBox = GetStorage(_auth.currentUser!.uid);
    final Map userDetails = userDetailsBox.read('userDetails');
    year = getStudentYear(userDetails['year']);
    semester = getStudentSemester(userDetails['semester']);
    isUserDetailsReady.value = true;
    userDetailsBox.listen(() {
      fetchCourses();
    });
    fetchCourses();
    super.onInit();
  }

  // fetch courses from firestore with loading state
  Future<void> fetchCourses() async {
    final Map userDetails = userDetailsBox.read('userDetails');
    year = getStudentYear(userDetails['year']);
    semester = getStudentSemester(userDetails['semester']);
    courses.value = Left(AppStatus(status: Status.loading));
    try {
      final coursesSnapshot = await Database.coursesCollection
          .where(
            "semester",
            isEqualTo: semester,
          )
          .where("level", isEqualTo: year)
          .get();
      final coursesList = coursesSnapshot.docs.map((course) {
        final courseData = course.data();
        courseData['id'] = course.id;
        courseData['totalResources'] = courseData['resources']?.length ?? 0;
        return CourseModel.fromMap(courseData);
      }).toList();
      courses.value = Right(coursesList);
    } catch (e) {
      print(e.toString());
      courses.value = Left(AppStatus(status: Status.failure));
    }
  }
}

String getStudentYear(int year) {
  if (year == 0) {
    return "100";
  } else if (year == 1) {
    return "200";
  }
  return "300";
}

int getStudentSemester(int semester) {
  if (semester == 0) {
    return 1;
  }
  return 2;
}
