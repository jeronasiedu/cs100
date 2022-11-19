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
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => controller.isUserDetailsReady.value
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "KNUST",
                    ),
                    Text(
                      "Level ${controller.year}",
                    )
                  ],
                )
              : const Spinner(),
        ),
      ),
      body: Obx(
        () => controller.courses.value.fold(
          (l) => Center(
            child: l.state,
          ),
          (courses) => GridView.builder(
            padding: const EdgeInsets.all(12),
            physics: const BouncingScrollPhysics(),
            itemCount: courses.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 10,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final String code = courses[index].code;
              final String name = courses[index].name;
              final String id = courses[index].id;
              final int totalResources = courses[index].totalResources;
              return Card(
                elevation: Get.isDarkMode ? 1 : 0.5,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Chip(
                          label: Text(
                            code,
                            // style: Get.textTheme.headlineSmall,
                          ),
                          backgroundColor:
                              Get.theme.colorScheme.primaryContainer,
                          labelStyle: Get.textTheme.bodyText2!.copyWith(
                            color: Get.theme.colorScheme.onPrimaryContainer,
                          ),
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
                          labelStyle: Get.textTheme.bodyText2!.copyWith(
                              // color: Get.theme.colorScheme.onPrimary,
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
    );
  }
}

/* 
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
    )

 */