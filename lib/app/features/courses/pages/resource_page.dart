import 'package:cs_100/app/features/courses/controllers/resource_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResourcePage extends StatelessWidget {
  ResourcePage({super.key});
  final ResourceController controller = Get.put(ResourceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.name),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                controller.shareResource();
              },
              icon: const Icon(Icons.share),
            ),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(12),
        children: [
          Text(
            controller.description,
            style: Get.textTheme.bodyText1,
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              controller.openResource();
            },
            child: Text(controller.buttonText),
          )
        ],
      ),
    );
  }
}
