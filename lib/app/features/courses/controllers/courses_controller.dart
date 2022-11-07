import 'package:cs_100/app/features/courses/models/course_model.dart';
import 'package:cs_100/shared/app_status.dart';
import 'package:cs_100/shared/database.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class CoursesController extends GetxController {
  final courses = Rx<Either<AppStatus, List<CourseModel>>>(
    const Right(<CourseModel>[]),
  );
  @override
  void onInit() {
    fetchCourses();
    super.onInit();
  }

  // fetch courses from firestore with loading state
  Future<void> fetchCourses() async {
    courses.value = Left(AppStatus(status: Status.loading));
    try {
      final coursesSnapshot = await Database.coursesCollection
          .where(
            "semester",
            isEqualTo: 1,
          )
          .get();
      final coursesList = coursesSnapshot.docs.map((course) {
        final courseData = course.data();
        courseData['id'] = course.id;
        return CourseModel.fromMap(courseData);
      }).toList();
      courses.value = Right(coursesList);
    } catch (e) {
      courses.value = Left(AppStatus(status: Status.failure));
    }
  }
}
