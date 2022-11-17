import 'package:cs_100/app/features/ads/ad_helper.dart';
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
  final courses = Rx<Either<AppStatus, List<CourseModel>>>(
    const Right(<CourseModel>[]),
  );
  @override
  void onInit() {
    userDetailsBox = GetStorage(_auth.currentUser!.uid);
    final Map userDetails = userDetailsBox.read('userDetails');
    year = getStudentYear(userDetails['year']);
    semester = getStudentSemester(userDetails['semester']);
    userDetailsBox.listen(() {
      fetchCourses();
    });
    fetchCourses();
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd!.value = ad as BannerAd;
          print('add has been loaded');
        },
        onAdFailedToLoad: (ad, error) {
          print("Ad error ${error.message}");
          ad.dispose();
        },
      ),
    ).load();
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
        return CourseModel.fromMap(courseData);
      }).toList();
      courses.value = Right(coursesList);
    } catch (e) {
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
