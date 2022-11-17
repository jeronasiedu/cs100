import 'package:cs_100/app/features/courses/controllers/domains_controller.dart';
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
                children: List.generate(
                  domains.length,
                  (index) {
                    final resources = domains[index].resources;
                    return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final String name = resources[index].name;
                        return ListTile(
                          onTap: () {},
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
