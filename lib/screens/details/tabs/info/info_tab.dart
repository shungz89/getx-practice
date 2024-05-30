import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';
import 'info_tab_controller.dart';

class InfoTab extends GetWidget<InfoTabController> {
  InfoTab({Key? key}) : super(key: key);

  @override
  String? get tag => Get.arguments['tag'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          // constraints: BoxConstraints(
          //   minHeight: Get.height,
          // ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              _infoResultWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoResultWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            Get.offNamedUntil("/", (route) => false);
          },
          child: const Text("Fetch Data"),
        ),

        // Container()
        //      : const Text("No Data", style: TextStyle(color: AppColors.white),),
      ],
    );
  }
}
