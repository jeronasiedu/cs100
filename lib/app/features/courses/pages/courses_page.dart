import 'package:cs_100/app/features/courses/controllers/courses_controller.dart';
import 'package:cs_100/app/features/courses/pages/domains_page.dart';
import 'package:cs_100/shared/spinner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesPage extends StatelessWidget {
  CoursesPage({Key? key}) : super(key: key);
  final CoursesController controller = Get.put(CoursesController());
  @override
  Widget build(BuildContext context) {
    final int crossAxisCount = context.width ~/ 180;
    return SafeArea(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  bottom: 8, left: 14, right: 14, top: 12),
              child: DefaultTextStyle(
                style: Get.textTheme.headline6!,
                child: Obx(
                  () => controller.isUserDetailsReady.value
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "KNUST",
                            ),
                            Text(
                              "Level ${controller.year}",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            )
                          ],
                        )
                      : const Spinner(),
                ),
              )),
          Expanded(
            child: Obx(
              () => controller.courses.value.fold(
                (l) => Center(
                  child: l.state,
                ),
                (r) => GridView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: r.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final String code = r[index].code;
                    final String name = r[index].name;
                    final String id = r[index].id;
                    final int totalResources = r[index].totalResources;
                    return Card(
                      elevation: Get.isDarkMode ? 1 : 0.5,
                      child: InkWell(
                        onTap: () {
                          Get.to(
                            () => DomainsPage(),
                            arguments: {
                              'code': code,
                              'name': name,
                              'id': id,
                            },
                          );
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                code,
                                style: Get.textTheme.headline6,
                              ),
                              const Spacer(),
                              Text(
                                name,
                                style: Get.textTheme.bodyText1!.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Chip(
                                label: Text('$totalResources Resources'),
                                backgroundColor: Get.theme.colorScheme.primary
                                    .withOpacity(0.8),
                                labelStyle: Get.textTheme.bodyText2!.copyWith(
                                  color: Get.theme.colorScheme.onPrimary,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
