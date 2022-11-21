import 'package:cs_100/app/features/courses/controllers/courses_controller.dart';
import 'package:cs_100/app/features/courses/pages/domains_page.dart';
import 'package:cs_100/app/features/settings/pages/profile_page.dart';
import 'package:cs_100/shared/spinner.dart';
import 'package:cs_100/shared/utils/custom_image.dart';
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
        titleTextStyle: Get.textTheme.bodyLarge,
        title: Obx(
          () => controller.isUserDetailsReady.value
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(1000),
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/logo.png'),
                        ),
                      ),
                    ),
                    GetBuilder<CoursesController>(
                      init: CoursesController(),
                      initState: (_) {},
                      builder: (_) {
                        return TextButton.icon(
                            onPressed: () {
                              Get.to(() => ProfilePage());
                            },
                            icon: const Icon(Icons.school_outlined),
                            label: Text("lv${controller.year}@KNUST"));
                      },
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
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              final String code = courses[index].code;
              final String name = courses[index].name;
              final String id = courses[index].id;
              final String thumbnail = courses[index].thumbnail;
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
                        Center(
                          child: FractionallySizedBox(
                            widthFactor: 0.7,
                            child: CustomImage(
                              imageUrl: thumbnail,
                              width: double.maxFinite,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          code.toUpperCase(),
                          style: const TextStyle(),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
Chip(
                          label: Text(
                            code.toUpperCase(),
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
 */