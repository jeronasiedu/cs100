import 'package:cs_100/app/features/courses/controllers/courses_controller.dart';
import 'package:cs_100/app/features/courses/pages/domains_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesPage extends StatelessWidget {
  CoursesPage({Key? key}) : super(key: key);
  final CoursesController controller = Get.put(CoursesController());
  @override
  Widget build(BuildContext context) {
    final int crossAxisCount = context.width ~/ 180;
    return Obx(
      () => controller.courses.value.fold(
        (l) => Center(
          child: l.state,
        ),
        (r) => GridView.builder(
          padding: const EdgeInsets.all(14),
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
            return Card(
              elevation: 0.5,
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
                      Text(code),
                      const Spacer(),
                      Text(
                        name,
                        style: Get.textTheme.bodyText1!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                      const Chip(
                        label: Text("36 lessons"),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
