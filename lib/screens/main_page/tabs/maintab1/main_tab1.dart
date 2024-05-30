import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../widgets/user_item_widget.dart';
import 'main_tab1_controller.dart';

class MainTab1 extends GetView<MainTab1Controller> {
  const MainTab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int pixel = Get.pixelRatio.toInt();
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    return SafeArea(
      ///Need only if we use that bottomNavigation that requires partial transparency
      ///that overlaps with the content and extendedBody must be set to 'true'
      top: true,
      bottom: false,
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: CustomScrollView(
          controller: controller.customScrollController,
          slivers: _listOfSlivers(context),
        ),
        // floatingActionButton: _floatingActionButton(),
      ),
    );
  }

  List<Widget> _listOfSlivers(BuildContext context) {
    return [
      SliverToBoxAdapter(
        child: Obx(
          () => !controller.userList.value.isBlank!
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

                  ///change here
                  itemCount: controller.userList.length,
                  itemBuilder: (context, index) {
                    return UserItemWidget(controller.userList[index],
                        onTap: () {
                      controller.goToDetailsPage(controller.userList[index]);
                    });
                  },
                )
              : SizedBox.shrink(),
        ),
      ),
    ];
  }
}
