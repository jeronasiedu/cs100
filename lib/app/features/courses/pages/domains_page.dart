import 'package:cs_100/app/features/courses/controllers/domains_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DomainsPage extends StatelessWidget {
  DomainsPage({Key? key}) : super(key: key);
  final DomainsController controller = Get.put(DomainsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.name),
      ),
    );
  }
}
