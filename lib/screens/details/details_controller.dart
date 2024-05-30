import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../api/api_repository.dart';
import '../../models/sub_object.dart';
import '../../routes/app_routes.dart';

class DetailsController extends GetxController
    with GetTickerProviderStateMixin, WidgetsBindingObserver {
  final ApiRepository apiRepository;
  double tabWidth = Get.width / 5;
  late TabController tabController;

  RxInt tabIndexRx = 0.obs;

  RxList<Tab> detailsTabs = <Tab>[
    Tab(
      child: Container(
        child: Center(
          child: Text(
            "Tab 1",
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        child: Center(
          child: Text(
            "Tab 2",
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        child: Center(
          child: Text(
            "Tab 3".tr,
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        child: Center(
          child: Text(
            "Tab 4".tr,
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        child: Center(
          child: Text(
            "Tab 5".tr,
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        child: Center(
          child: Text(
            "Tab 6".tr,
          ),
        ),
      ),
    ),
  ].obs;

  RxInt selectedIndex = 0.obs;

  late StreamSubscription streamSubscription;

  AnimationController? refreshAnimationController;

  GlobalKey tabBarKey = GlobalKey();
  RxBool showTabBlur = false.obs;

  DetailsController({required this.apiRepository});

  @override
  Future<void> onInit() async {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);

    tabController = TabController(
        vsync: this,
        length: detailsTabs.length,
        initialIndex: selectedIndex.value);


    tabController.addListener(() async {

      if (tabController.indexIsChanging) {
        print(
            "tab is animating. from active (getting the index) to inactive(getting the index) ");
      } else {
        //tab is finished animating you get the current index
        //here you can get your index or run some method once.
        selectedIndex.value = tabController.index;
        print(tabController.index);
        await initializeTab();
        // await refreshCurrentTab();
      }
    });
  }

  bool isTabBlur(RenderBox tabBarBox) {
    return !(tabBarBox.size.width < Get.width);
  }

  Future<void> initializeTab() async {
    tabIndexRx.value = tabController.index;
    switch (tabController.index) {
      case 0:
        // await callSomeAPI();
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
    }
    update();
  }

  @override
  void onClose() async {
    if (refreshAnimationController != null) {
      refreshAnimationController!.dispose();
    }
    super.onClose();
  }

  void backBtnClicked() async {
    Get.back();
  }
}
