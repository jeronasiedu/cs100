import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs_100/app/features/courses/models/domain_model.dart';
import 'package:cs_100/app/features/courses/models/resource_model.dart';
import 'package:cs_100/shared/app_status.dart';
import 'package:cs_100/shared/database.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class DomainsController extends GetxController {
  final String code = Get.arguments['code'];
  final String name = Get.arguments['name'];
  final String courseId = Get.arguments['id'];
  final String thumbnail = Get.arguments['thumbnail'];
  final domains = Rx<Either<AppStatus, List<DomainModel>>>(
    const Right(<DomainModel>[]),
  );

  @override
  void onInit() async {
    await fetchResources();
    super.onInit();
  }

  // fetch resources from firestore with loading state
  Future<void> fetchResources() async {
    domains.value = Left(AppStatus(status: Status.loading));
    List<ResourceModel> tempResources = [];
    List<DomainModel> tempDomains = [];

    try {
      // fetch the course with the given id
      final courseSnapshot =
          await Database.coursesCollection.doc(courseId).get();
      final courseData = courseSnapshot.data();
      final List resourcesRefs = courseData!['resources'];
      for (DocumentReference resourceRef in resourcesRefs) {
        final String id = resourceRef.id;
        final resourceSnapshot =
            await Database.resourcesCollection.doc(id).get();
        final data = resourceSnapshot.data()!;
        final DocumentReference domainRef = data['domain'];
        final domainSnapshot =
            await Database.domainsCollection.doc(domainRef.id).get();
        final domainData = domainSnapshot.data();
        data['domainName'] = domainData!['name'];
        data['domainThumbnail'] = domainData['thumbnail'];
        tempResources.add(ResourceModel.fromMap(data));
      }
      final groupedResources = tempResources.groupBy((m) => m.domainName);
      groupedResources.forEach((key, resources) {
        tempDomains.add(
          DomainModel(
            name: key,
            resources: resources,
            thumbnail: resources.first.domainThumbnail,
          ),
        );
      });
      domains.value = Right(tempDomains);
    } catch (e) {
      Left(AppStatus(status: Status.failure));
    }
  }
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}
