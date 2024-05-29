import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:getx_as_sj/screens/main_page/tabs/maintab1/main_tab1_controller.dart';

import '../../api/api_repository.dart';

class MainPageController extends GetxController
    with WidgetsBindingObserver, GetTickerProviderStateMixin {
  ///We no longer use this because to prevent the blinking of the Tab
  // var tabIndex = 0;
  String localeString = '';

  ///TODO://Set this to true if we want to display Main Circle in the middle
  ///TODO://and have the UI follow this changes
  final bool isHaveMainEventTab = true;

  final ApiRepository apiRepository;
  RxString sysLang = ''.obs;
  MainTab1Controller mainTab1Controller = Get.find();

  RxString authStatus = 'Unknown'.obs;
  RxBool shouldShowContestCircle = false.obs;
  RxBool isUpdatePopupShowing = false.obs;

  int tabPagesNormalTotalCount = 4;
  int tabPagesWithMainEventTotalCount = 5;


  late TabController tabController = new TabController(
    vsync: this,
    length: tabPagesNormalTotalCount,
    initialIndex: 0,
  );

  RxBool isShowing = true.obs;
  RxInt timerCount = 1.obs;
  RxInt carouselIndex = 0.obs;

  RxBool isFirstTimeLoadApp = true.obs;

  late StreamSubscription streamSubscription;

  RxInt tabIndex = 0.obs;

  MainPageController({required this.apiRepository});

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        update();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    print("MainPageController dispose");
    streamSubscription.cancel();
    WidgetsBinding.instance.removeObserver(this);
  }

  void changeTabIndex(int index) async {
    print("changeTabIndex::${index}");

    ///We do a checking to prevent blinking at Tab Button if user click twice.
    ///Also currently the App does not need to refresh tab when spam clicking same Tabs.
    if (tabController.index != index) {
      tabController.animateTo(index, duration: Duration(milliseconds: 100));
      tabIndex.value = index;
    }
  }

  //This is to auto refresh the page each time if user goes out the app and then come back in
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    print('state = $state');
  }

  @override
  void didChangeLocales(List<Locale>? locales) async {
    // TODO: implement didChangeLocales
    super.didChangeLocales(locales);
    await Get.asap(() async {
      //Solution 1:
      // await setLangBasedOnConditionAtMainPageController();
      // await updateAllTabsControllerExceptEvent();

      //We use solution 2 because we want to make user restart the App otherwise
      //we will add on more test scenario.
      //Solution 2:
      await SystemNavigator.pop();

      print("ASAP changeLocale");
    });
  }
}
