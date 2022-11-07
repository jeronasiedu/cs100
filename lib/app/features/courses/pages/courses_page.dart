import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ionicons/ionicons.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int crossAxisCount = Get.width ~/ 180;
    return GridView.builder(
      padding: const EdgeInsets.all(14),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 10,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return Card(
          elevation: 0.5,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Ionicons.book_outline,
                        size: 30,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "Literature",
                    style: Get.textTheme.bodyText1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
    );
  }
}
