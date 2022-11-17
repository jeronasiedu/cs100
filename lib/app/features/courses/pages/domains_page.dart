import 'package:cs_100/app/features/courses/controllers/domains_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DomainsPage extends StatelessWidget {
  DomainsPage({Key? key}) : super(key: key);
  final DomainsController controller = Get.put(DomainsController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(controller.name),
          bottom: TabBar(
            isScrollable: true,
            

            tabs: [
              Tab(
                child: Chip(
                  label: const Text("Youtube"),
                  avatar: Image.asset('assets/youtube.png'),
                ),
              ),
              Tab(
                child: Chip(
                  label: const Text("Website"),
                  avatar: Image.asset('assets/website.png'),
                ),
              ),
              Tab(
                child: Chip(
                  label: const Text("Book"),
                  avatar: Image.asset('assets/book.png'),
                ),
              ),
              Tab(
                child: Chip(
                  label: const Text("Quiz"),
                  avatar: Image.asset('assets/quiz.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
