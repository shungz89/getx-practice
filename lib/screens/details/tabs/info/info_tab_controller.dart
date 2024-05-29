import 'dart:async';

import 'package:get/get.dart';

import '../../../../api/api_repository.dart';

class InfoTabController extends GetxController {
  final ApiRepository apiRepository;

  InfoTabController({required this.apiRepository});

  Timer? intervalTimer;
  String idString = Get.arguments['id'].toString();

  @override
  Future<void> onInit() async {
    super.onInit();

    await info(idString);
  }

  @override
  void onClose() {
    super.onClose();
    intervalTimer != null ? intervalTimer!.cancel() : null;
  }

  Future<void> info(String id) async {}
}
