import 'package:cs_100/app/features/courses/controllers/domains_controller.dart';
import 'package:cs_100/app/features/courses/pages/resource_page.dart';
import 'package:cs_100/shared/utils/custom_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DomainsPage extends StatelessWidget {
  DomainsPage({Key? key}) : super(key: key);
  final DomainsController controller = Get.put(DomainsController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.domains.value.fold(
          (l) => Scaffold(
            appBar: AppBar(
              title: Text(controller.name),
              titleTextStyle: Get.textTheme.headline6!.copyWith(
                fontSize: 20,
              ),
            ),
            body: Center(
              child: l.state,
            ),
          ),
          (domains) => DefaultTabController(
            length: domains.length,
            child: Scaffold(
              appBar: AppBar(
                title: Text(controller.name),
                bottom: TabBar(
                    physics: const BouncingScrollPhysics(),
                    isScrollable: true,
                    tabs: List.generate(
                      domains.length,
                      (index) {
                        final String domainName = domains[index].name;
                        final String domainThumbnail = domains[index].thumbnail;
                        return Tab(
                          child: Chip(
                            label: Text(domainName),
                            avatar: CustomAvatar(imageUrl: domainThumbnail),
                          ),
                        );
                      },
                    )),
              ),
              body: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: List.generate(
                  domains.length,
                  (index) {
                    final resources = domains[index].resources;
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final String name = resources[index].name;
                        final String description = resources[index].description;
                        final String url = resources[index].url;
                        return ListTile(
                          onTap: () {
                            Get.to(() => ResourcePage(), arguments: {
                              "description": description,
                              "name": name,
                              "url": url,
                            });
                          },
                          title: Text(name),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const Divider(height: 0),
                      itemCount: resources.length,
                    );
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
