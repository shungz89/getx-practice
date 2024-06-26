import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_as_sj/models/request/get_some_list_request.dart';
import 'package:getx_as_sj/models/result/get_user_list_result.dart';
import 'package:getx_as_sj/routes/app_pages.dart';
import 'package:getx_as_sj/routes/app_routes.dart';

import '../../../../api/api_repository.dart';
import '../../../../models/some_object.dart';
import '../../../../widgets/common_widget.dart';

class MainTab1Controller extends GetxController {
  RxList<GetUserListResult> userList = <GetUserListResult>[].obs;

  ScrollController customScrollController = ScrollController();

  final ApiRepository apiRepository;

  Timer? intervalTimer;

  MainTab1Controller({required this.apiRepository});

  @override
  Future<void> onInit() async {
    super.onInit();
    await getUserList();
    CommonWidget.toast("Init Complete");
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getUserList() async {
    userList.clear();
    var userListFromApi =
        await apiRepository.getUserList(GetSomeListRequest(page: "2"));
    print(userListFromApi?.data);
    if (userListFromApi != null && userListFromApi.data != null) {
      userListFromApi.data?.forEach((element) {
        if (element != null) {
          userList.add(element);
        }
      });
    }
  }

  void goToDetailsPage(GetUserListResult user) {
    Get.toNamed(AppRoutes.DETAILS, arguments: {
      'user': user,
      'tag': "${DateTime.now().millisecondsSinceEpoch}"
    });
  }
}
