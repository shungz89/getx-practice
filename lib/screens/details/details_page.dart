import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_as_sj/screens/details/tabs/info/info_tab.dart';

import '../../api/api_constants.dart';
import 'details_controller.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
        tag: Get.arguments['tag'],
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Details Page"),
            ),
            body: Container(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _topWidget(controller),
                  TabBar(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    labelPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 4,
                    controller: controller.tabController,
                    indicatorColor: Colors.purple,
                    labelColor: Colors.purple,
                    labelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NotoSansThai'),
                    unselectedLabelColor: Colors.purpleAccent,
                    unselectedLabelStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'NotoSansThai'),
                    isScrollable: false,
                    indicatorPadding: EdgeInsets.zero,

                    tabs: controller.detailsTabs,
                    onTap: (index) {},
                    // physics: NeverScrollableScrollPhysics(),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabController,
                      children: [
                        InfoTab(),
                        Text("Tab2"),
                        Text("Tab3"),
                        Text("Tab4"),
                        Text("Tab5"),
                        Text("Tab6"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _topWidget(DetailsController controller) {
    return Container(
      child: Text("Top Widget", style: TextStyle(fontSize: 24, color: Colors.white),)
    );
  }
}
