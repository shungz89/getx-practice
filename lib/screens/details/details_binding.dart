import 'package:get/get.dart';
import 'package:getx_as_sj/screens/details/tabs/info/info_tab_controller.dart';

import 'details_controller.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    String tag = Get.arguments['tag'];
    Get.create<DetailsController>(
        () => DetailsController(apiRepository: Get.find()),
        tag: tag);
    Get.lazyPut<InfoTabController>(
        () => InfoTabController(apiRepository: Get.find()),
        tag: tag);
  }
}
