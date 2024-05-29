import 'package:get/get.dart';
import 'package:getx_as_sj/screens/main_page/tabs/maintab1/main_tab1_controller.dart';

import 'main_page_controller.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(
      () => MainPageController(apiRepository: Get.find()),
    );

    Get.lazyPut<MainTab1Controller>(
      () => MainTab1Controller(apiRepository: Get.find()),
    );

  }
}
